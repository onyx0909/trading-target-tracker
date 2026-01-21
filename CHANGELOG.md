# TargetTrader Changelog

## v4.3.0 - Intraday Closed Trades (2026-01-22)

### ✨ New Feature: Track Closed Trades During the Day
Previously, you had to wait for the broker statement to enter your daily P/L. Now you can log closed trades in real-time!

### ⚠️ REQUIRED: Supabase Migration
Run `supabase-migration-v4.3.0.sql` in your Supabase SQL Editor to create the new table!

### Where to Find It
- **Dashboard**: New "Heute geschlossen" (Closed Today) card next to Open Positions
- **Positions Tab**: Same card with full trade list
- **Entry Tab**: Shows hint with total intraday P/L if trades exist

### How It Works
1. Click "+ Trade erfassen" (Log Trade)
2. Select instrument (optional) and enter P/L
3. Add note if desired (e.g., "TP1 hit")
4. Trades automatically appear in:
   - Today's P/L calculation
   - Daily progress indicator
   - Weekly totals
5. Data syncs to Supabase cloud!

### Technical Details
- New data structure: `intradayClosedTrades[]`
- New Supabase table: `intraday_closed_trades`
- Automatic cleanup of old trades on app start
- Full cloud sync support
- Full integration with existing P/L calculations

### Translations Added (DE/EN/ES)
- closedToday, noClosedTrades, addClosedTrade
- closedTradeAdded, closedTradeRemoved
- intradayRealized

---

## v4.2.0 - Custom Icon System (2026-01-21)
- 25+ custom SVG icons replacing all emojis
- Military scope design language
- Subtle SL/TP boxes (border accent)
- Equity curve fix (starts with first day's startingBalance)

## v4.1.0 - TargetTrader Branding (2026-01-21)
- New logo and name
- Favicon and manifest updates

## v4.0.0 - Cloud Sync
- Supabase cloud synchronization
- Multi-device support
- User authentication
