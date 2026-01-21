# TargetTrader Changelog

## v4.2.0 - Custom Icon System (2026-01-21)

### ✨ New Features
- Complete custom SVG icon system (25+ icons)
- Military scope design language throughout app
- All emojis replaced with vector icons
- Color-coded icons for moods, instruments, and status

### 🎨 Icon Categories
- Navigation: dashboard, positions, entry, performance, instruments, history, settings
- Trading: target, profit, buffer, streak, balance, projection
- Instruments: gold (reused for all metals with color coding)
- Moods: moodG (great), moodO (good), moodN (neutral), moodB (bad)
- Status: check, warn, lock, eye, edit, trash, stop
- UI: sun, moon, cloud, sync, bulb, rocket

### 🔧 Technical
- `ic(name, size, color)` function for dynamic icon rendering
- `.i` CSS class with size variants (i-16, i-18, i-20, i-24, i-32)
- Inline SVG for zero external dependencies
- Theme-aware colors using CSS variables

## v4.1.0 - TargetTrader Branding (2026-01-21)

### ✨ Branding
- New "TargetTrader" name and logo
- Military scope crosshair design
- 6-candle chart visualization
- Favicon and manifest updates

## v4.0.0 - Cloud Sync (2026-01-xx)

### ✨ Features
- Supabase cloud synchronization
- Multi-device support
- User authentication
- Data migration wizard

## v3.x - Core Features

- Daily P/L tracking
- Buffer/reserve system
- Instrument calibration
- Position management
- Equity curve charts
- Multi-language (DE/EN/ES)
