# Changelog

All notable changes to TargetTrader will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [4.3.3] - 2026-01-21

### Fixed
- **Tooltip z-index**: Tooltips now display correctly above all form fields and cards (z-index increased to 9999)
- **Card overflow**: Removed `overflow:hidden` from cards that was clipping tooltips
- **Mobile layout**: Progress circles and details now stack vertically on mobile screens

### Added
- **Tomorrow's target preview**: Daily progress section now shows what your target will be tomorrow
- **CSS class**: Added `.text-accent` utility class for accent-colored text

### Changed
- **Default daily target**: Changed from 1.03% to 0.5% (more realistic for most traders)

## [4.3.2] - 2026-01-20

### Fixed
- Mobile responsive layout for progress grid (vertical stacking on screens < 768px)
- Explicit width/height for circle-progress containers at all breakpoints

## [4.3.1] - 2026-01-19

### Fixed
- Intraday closed trades now correctly contribute to realized P/L
- Combined P/L calculation for daily entries

## [4.3.0] - 2026-01-18

### Added
- **Intraday Closed Trades**: Quick entry for trades closed within the same day
- **Combined P/L Display**: Shows both positions and intraday trades in daily totals
- **Supabase Migration**: New `closed_trades` table for intraday trade storage

### Changed
- Dashboard stats now include intraday realized P/L
- Entry form shows combined totals

## [4.2.0] - 2026-01-15

### Added
- **Circular Progress Indicators**: Replaced linear bars with modern circular progress
- **Compact Progress Grid**: More information in less space
- **Buffer Capacity Visualization**: Visual indicator for buffer fill level

### Changed
- Complete dashboard redesign with improved data density
- Mobile-optimized breakpoints (768px, 640px, 480px, 380px)

## [4.1.0] - 2026-01-12

### Added
- **Custom SVG Icon Set**: 25+ military scope-inspired icons
- **Icon Helper Function**: `ic(name, size, color)` for easy icon usage
- **Consistent Visual Language**: All icons follow the same design principles

### Changed
- Replaced emoji icons with custom SVGs throughout the app
- Improved visual hierarchy and readability

## [4.0.0] - 2026-01-08

### Added
- **Cloud Sync**: Full Supabase integration with PostgreSQL backend
- **Authentication**: Google OAuth and Email/Password login
- **Multi-Device Support**: Sync data across all your devices
- **Conflict Resolution**: Smart merge for simultaneous edits

### Changed
- Data structure optimized for cloud storage
- Improved error handling and offline fallback

## [3.9.0] - 2025-12-20

### Added
- **Internationalization (i18n)**: Support for German, English, Spanish
- **Dynamic Language Switching**: Change language without page reload
- **Translated Tooltips**: All help texts available in all languages

## [3.5.0] - 2025-12-01

### Added
- **Buffer System**: Automatic surplus collection for losing days
- **Buffer History**: Track all buffer additions and withdrawals
- **Buffer Settings**: Configurable enable/disable and max days

## [3.0.0] - 2025-11-15

### Added
- **Instrument Calibration**: Automatic P/L factor calculation
- **Position Manager**: Track multiple open positions
- **SL/TP Calculator**: Quick risk management calculations

### Changed
- Complete architecture rewrite
- Single-file HTML application

## [2.0.0] - 2025-10-01

### Added
- **PWA Support**: Install as native app on any device
- **Offline Mode**: Full functionality without internet
- **Local Storage**: Persistent data storage

## [1.0.0] - 2025-09-01

### Added
- Initial release
- Basic daily target tracking
- Simple P/L entry
- Equity curve visualization
