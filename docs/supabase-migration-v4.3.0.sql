-- ============================================================
-- TargetTrader v4.3.0 - Intraday Closed Trades Table
-- Run this in your Supabase SQL Editor
-- ============================================================

-- Create the intraday_closed_trades table
CREATE TABLE IF NOT EXISTS intraday_closed_trades (
    id TEXT PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    instrument_id TEXT,
    pl NUMERIC(12,2) NOT NULL DEFAULT 0,
    note TEXT,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    closed_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_intraday_trades_user_date 
ON intraday_closed_trades(user_id, date);

-- Enable Row Level Security
ALTER TABLE intraday_closed_trades ENABLE ROW LEVEL SECURITY;

-- RLS Policy: Users can only see their own trades
CREATE POLICY "Users can view own intraday trades" 
ON intraday_closed_trades FOR SELECT 
USING (auth.uid() = user_id);

-- RLS Policy: Users can insert their own trades
CREATE POLICY "Users can insert own intraday trades" 
ON intraday_closed_trades FOR INSERT 
WITH CHECK (auth.uid() = user_id);

-- RLS Policy: Users can update their own trades
CREATE POLICY "Users can update own intraday trades" 
ON intraday_closed_trades FOR UPDATE 
USING (auth.uid() = user_id);

-- RLS Policy: Users can delete their own trades
CREATE POLICY "Users can delete own intraday trades" 
ON intraday_closed_trades FOR DELETE 
USING (auth.uid() = user_id);

-- Optional: Auto-cleanup old trades (trades older than 7 days)
-- Uncomment if you want automatic cleanup
/*
CREATE OR REPLACE FUNCTION cleanup_old_intraday_trades()
RETURNS void AS $$
BEGIN
    DELETE FROM intraday_closed_trades 
    WHERE date < CURRENT_DATE - INTERVAL '7 days';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
*/

-- ============================================================
-- Verify the table was created
-- ============================================================
SELECT 'Table created successfully!' as status, 
       column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'intraday_closed_trades';
