-- ============================================================
-- TRADING TRACKER PRO - SUPABASE SCHEMA
-- Version: 1.0 | Datum: 19.01.2026
-- ============================================================
-- Dieses Script im Supabase SQL Editor ausführen:
-- Dashboard → SQL Editor → New Query → Paste → Run

-- 1. PROFILES TABLE
CREATE TABLE IF NOT EXISTS profiles (
    id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
    email TEXT,
    display_name TEXT,
    account_currency TEXT DEFAULT 'EUR',
    broker TEXT DEFAULT 'IBKR',
    start_capital DECIMAL(15,2) DEFAULT 10000,
    current_balance DECIMAL(15,2) DEFAULT 10000,
    target_capital DECIMAL(15,2) DEFAULT 1000000,
    daily_target_percent DECIMAL(5,2) DEFAULT 1.03,
    risk_per_trade_percent DECIMAL(5,2) DEFAULT 2.0,
    max_daily_loss_percent DECIMAL(5,2) DEFAULT 3.0,
    rr_ratio DECIMAL(3,1) DEFAULT 2.0,
    trading_days_per_week INTEGER DEFAULT 5,
    buffer_enabled BOOLEAN DEFAULT true,
    buffer_auto_use BOOLEAN DEFAULT true,
    buffer_max_days INTEGER DEFAULT 10,
    buffer_current DECIMAL(15,2) DEFAULT 0,
    language TEXT DEFAULT 'de',
    theme TEXT DEFAULT 'dark',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. INSTRUMENTS TABLE
CREATE TABLE IF NOT EXISTS instruments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    symbol TEXT NOT NULL,
    name TEXT,
    asset_class TEXT NOT NULL,
    icon TEXT,
    color TEXT,
    price_decimals INTEGER DEFAULT 2,
    quote_currency TEXT DEFAULT 'USD',
    calculation_type TEXT NOT NULL,
    pl_factor DECIMAL(10,6),
    pip_size DECIMAL(10,6),
    pip_value DECIMAL(10,4),
    is_calibrated BOOLEAN DEFAULT false,
    last_calibrated TIMESTAMPTZ,
    calibration_data JSONB,
    standard_size DECIMAL(15,4) DEFAULT 1,
    is_custom BOOLEAN DEFAULT false,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, symbol)
);

-- 3. POSITIONS TABLE
CREATE TABLE IF NOT EXISTS positions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    instrument_symbol TEXT,
    size DECIMAL(15,4) NOT NULL,
    avg_price DECIMAL(15,6) NOT NULL,
    current_price DECIMAL(15,6),
    direction TEXT DEFAULT 'long',
    stop_loss DECIMAL(15,6),
    take_profit DECIMAL(15,6),
    is_active BOOLEAN DEFAULT true,
    open_date DATE,
    close_date DATE,
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. DAILY LOGS TABLE
CREATE TABLE IF NOT EXISTS daily_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    date DATE NOT NULL,
    starting_balance DECIMAL(15,2),
    ending_balance DECIMAL(15,2),
    realized_pl DECIMAL(15,2),
    unrealized_pl DECIMAL(15,2),
    daily_target DECIMAL(15,2),
    variance DECIMAL(15,2),
    variance_percent DECIMAL(8,2),
    days_equivalent DECIMAL(8,2),
    target_hit BOOLEAN DEFAULT false,
    trades_count INTEGER DEFAULT 0,
    win_count INTEGER DEFAULT 0,
    loss_count INTEGER DEFAULT 0,
    mood TEXT,
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, date)
);

-- 5. BUFFER HISTORY TABLE
CREATE TABLE IF NOT EXISTS buffer_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    date DATE NOT NULL,
    type TEXT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    reason TEXT,
    balance_after DECIMAL(15,2),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. ROW LEVEL SECURITY (RLS)
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE instruments ENABLE ROW LEVEL SECURITY;
ALTER TABLE positions ENABLE ROW LEVEL SECURITY;
ALTER TABLE daily_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE buffer_history ENABLE ROW LEVEL SECURITY;

-- Profiles Policies
CREATE POLICY "profiles_select" ON profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "profiles_update" ON profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "profiles_insert" ON profiles FOR INSERT WITH CHECK (auth.uid() = id);

-- Instruments Policies
CREATE POLICY "instruments_select" ON instruments FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "instruments_insert" ON instruments FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "instruments_update" ON instruments FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "instruments_delete" ON instruments FOR DELETE USING (auth.uid() = user_id);

-- Positions Policies
CREATE POLICY "positions_select" ON positions FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "positions_insert" ON positions FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "positions_update" ON positions FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "positions_delete" ON positions FOR DELETE USING (auth.uid() = user_id);

-- Daily Logs Policies
CREATE POLICY "daily_logs_select" ON daily_logs FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "daily_logs_insert" ON daily_logs FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "daily_logs_update" ON daily_logs FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "daily_logs_delete" ON daily_logs FOR DELETE USING (auth.uid() = user_id);

-- Buffer History Policies
CREATE POLICY "buffer_history_select" ON buffer_history FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "buffer_history_insert" ON buffer_history FOR INSERT WITH CHECK (auth.uid() = user_id);

-- 7. TRIGGERS FOR updated_at
CREATE OR REPLACE FUNCTION update_updated_at() RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_profiles_ts BEFORE UPDATE ON profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER update_instruments_ts BEFORE UPDATE ON instruments FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER update_positions_ts BEFORE UPDATE ON positions FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER update_daily_logs_ts BEFORE UPDATE ON daily_logs FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- 8. AUTO-CREATE PROFILE ON SIGNUP
CREATE OR REPLACE FUNCTION handle_new_user() RETURNS TRIGGER AS $$
BEGIN INSERT INTO profiles (id, email) VALUES (NEW.id, NEW.email); RETURN NEW; END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- 9. INDEXES
CREATE INDEX IF NOT EXISTS idx_instruments_user ON instruments(user_id);
CREATE INDEX IF NOT EXISTS idx_positions_user ON positions(user_id);
CREATE INDEX IF NOT EXISTS idx_daily_logs_user ON daily_logs(user_id);
CREATE INDEX IF NOT EXISTS idx_daily_logs_date ON daily_logs(user_id, date);
CREATE INDEX IF NOT EXISTS idx_buffer_history_user ON buffer_history(user_id);

-- DONE!
