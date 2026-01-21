# Supabase Setup Guide

This guide walks you through setting up Supabase for TargetTrader cloud sync.

## 1. Create a Supabase Project

1. Go to [supabase.com](https://supabase.com)
2. Sign up / Log in
3. Click **New Project**
4. Choose a name (e.g., "targettrader")
5. Set a secure database password
6. Select your region
7. Click **Create new project**

## 2. Run the Database Schema

Go to **SQL Editor** in your Supabase dashboard and run the following:

```sql
-- ============================================================
-- TargetTrader Complete Database Schema
-- ============================================================

-- Profiles (extends auth.users)
CREATE TABLE profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT,
    account_currency TEXT DEFAULT 'EUR',
    broker TEXT DEFAULT 'IBKR',
    start_capital NUMERIC(12,2) DEFAULT 0,
    current_balance NUMERIC(12,2) DEFAULT 0,
    target_capital NUMERIC(12,2) DEFAULT 0,
    daily_target_percent NUMERIC(5,2) DEFAULT 1.03,
    risk_per_trade_percent NUMERIC(5,2) DEFAULT 2.0,
    max_daily_loss_percent NUMERIC(5,2) DEFAULT 3.0,
    rr_ratio NUMERIC(4,2) DEFAULT 2,
    trading_days_per_week INTEGER DEFAULT 5,
    buffer_enabled BOOLEAN DEFAULT true,
    buffer_max_days INTEGER DEFAULT 10,
    buffer_current NUMERIC(12,2) DEFAULT 0,
    onboarding_complete BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Auto-create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (id, email)
    VALUES (NEW.id, NEW.email);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Instruments
CREATE TABLE instruments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    symbol TEXT NOT NULL,
    name TEXT,
    icon TEXT DEFAULT 'gold',
    color TEXT DEFAULT '#FFD700',
    price_decimals INTEGER DEFAULT 2,
    calculation_type TEXT DEFAULT 'forex',
    pl_factor NUMERIC(12,6),
    standard_size NUMERIC(12,4) DEFAULT 1,
    is_calibrated BOOLEAN DEFAULT false,
    last_calibrated TIMESTAMPTZ,
    calibration_data JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, symbol)
);

-- Daily Logs
CREATE TABLE daily_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    date DATE NOT NULL,
    starting_balance NUMERIC(12,2),
    ending_balance NUMERIC(12,2),
    realized_pl NUMERIC(12,2) DEFAULT 0,
    unrealized_pl NUMERIC(12,2) DEFAULT 0,
    daily_target NUMERIC(12,2),
    variance NUMERIC(12,2),
    variance_percent NUMERIC(8,4),
    days_equivalent NUMERIC(8,4),
    target_hit BOOLEAN DEFAULT false,
    trades_count INTEGER DEFAULT 0,
    mood TEXT,
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, date)
);

-- Positions
CREATE TABLE positions (
    id TEXT PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    instrument_symbol TEXT NOT NULL,
    size NUMERIC(12,4) NOT NULL,
    avg_price NUMERIC(16,6) NOT NULL,
    current_price NUMERIC(16,6),
    direction TEXT DEFAULT 'long',
    is_active BOOLEAN DEFAULT true,
    open_date DATE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Intraday Closed Trades (v4.3.0+)
CREATE TABLE intraday_closed_trades (
    id TEXT PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    instrument_id TEXT,
    pl NUMERIC(12,2) NOT NULL DEFAULT 0,
    note TEXT,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    closed_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_intraday_trades_user_date 
ON intraday_closed_trades(user_id, date);

-- ============================================================
-- Row Level Security (RLS)
-- ============================================================

ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE instruments ENABLE ROW LEVEL SECURITY;
ALTER TABLE daily_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE positions ENABLE ROW LEVEL SECURITY;
ALTER TABLE intraday_closed_trades ENABLE ROW LEVEL SECURITY;

-- Profiles policies
CREATE POLICY "Users can view own profile" ON profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update own profile" ON profiles FOR UPDATE USING (auth.uid() = id);

-- Instruments policies
CREATE POLICY "Users can view own instruments" ON instruments FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own instruments" ON instruments FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own instruments" ON instruments FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own instruments" ON instruments FOR DELETE USING (auth.uid() = user_id);

-- Daily logs policies
CREATE POLICY "Users can view own logs" ON daily_logs FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own logs" ON daily_logs FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own logs" ON daily_logs FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own logs" ON daily_logs FOR DELETE USING (auth.uid() = user_id);

-- Positions policies
CREATE POLICY "Users can view own positions" ON positions FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own positions" ON positions FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own positions" ON positions FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own positions" ON positions FOR DELETE USING (auth.uid() = user_id);

-- Intraday trades policies
CREATE POLICY "Users can view own intraday trades" ON intraday_closed_trades FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own intraday trades" ON intraday_closed_trades FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own intraday trades" ON intraday_closed_trades FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own intraday trades" ON intraday_closed_trades FOR DELETE USING (auth.uid() = user_id);
```

## 3. Configure Authentication

1. Go to **Authentication** → **Providers**
2. Enable **Email** provider
3. (Optional) Disable email confirmation for easier testing

## 4. Get Your Credentials

1. Go to **Settings** → **API**
2. Copy your **Project URL** (e.g., `https://xxxxx.supabase.co`)
3. Copy your **anon/public** key

## 5. Update TargetTrader

In `index.html`, find the Supabase configuration section and update:

```javascript
const SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';
```

## 6. Test the Connection

1. Open TargetTrader in your browser
2. Click **Sign Up** or **Log In**
3. Create an account
4. Verify data syncs to Supabase (check **Table Editor**)

## Troubleshooting

### "User already registered"
The email is already in use. Try logging in or use a different email.

### Data not syncing
- Check browser console for errors
- Verify RLS policies are correctly set up
- Ensure you're logged in

### CORS errors
Make sure your app domain is allowed in Supabase settings.

---

## Optional: Enable GitHub Pages Hosting

1. Go to your GitHub repo → **Settings** → **Pages**
2. Source: **Deploy from a branch**
3. Branch: **main** / **(root)**
4. Save

Your app will be live at: `https://onyx0909.github.io/trading-target-tracker/`
