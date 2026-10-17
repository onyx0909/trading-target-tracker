# TargetTrader 🎯

> **Status (October 2026): no longer maintained.** The Supabase project behind the cloud sync
> (`dxlrljzxyxlmcbndjuze`) is being shut down. Sign-in and cloud sync will stop working; the
> app keeps running locally in the browser. The database schema stays documented in
> [`docs/supabase-setup.md`](docs/supabase-setup.md); to self-host, create a new Supabase project,
> run that setup, and replace `SUPABASE_URL` and the anon key in `index.html`.

**Dynamic Trading Target Tracker with Compound Growth**

A professional Progressive Web App (PWA) for traders who want to track their daily profit targets using percentage-based compound growth instead of fixed amounts.

![Version](https://img.shields.io/badge/version-4.3.3-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![PWA](https://img.shields.io/badge/PWA-ready-purple)

## 🚀 Live Demo

**[https://onyx0909.github.io/trading-target-tracker/](https://onyx0909.github.io/trading-target-tracker/)**

## ✨ Features

### Core Features
- **Dynamic Daily Targets** - Automatically calculated based on account balance (default: 0.5%)
- **Realized vs. Unrealized P/L** - Separate tracking for closed trades and open positions
- **Intraday Closed Trades** - Quick entry for trades closed within the day
- **Buffer System** - Automatically stores surplus profits as reserve for losing days
- **Tomorrow's Target Preview** - See what your target will be tomorrow

### Trading Tools
- **Position Manager** - Track open positions with real-time P/L
- **Instrument Calibration** - Automatic P/L factor calculation for XAUUSD, XAGUSD, and more
- **SL/TP Calculator** - Quick stop-loss and take-profit calculation

### Analytics
- **Equity Curve** - Visual representation of your trading progress
- **Weekday Analysis** - Identify your best and worst trading days
- **Streak Tracking** - Monitor winning and losing streaks
- **Goal Projection** - Estimate time to reach your target capital

### Technical
- **Cloud Sync** - Sync data across all devices via Supabase
- **Offline Support** - Full PWA functionality, works without internet
- **Multi-language** - German, English, Spanish (DE/EN/ES)
- **Dark/Light Mode** - Eye-friendly themes
- **Responsive Design** - Optimized for desktop, tablet, and mobile

## 📱 Screenshots

### Dashboard
The main dashboard shows your daily progress with a circular progress indicator, today's target, realized/unrealized P/L, and tomorrow's target preview.

### Buffer System
Automatic profit reserve that helps you stay on track during losing days.

## 🛠️ Installation

### Option 1: Use Online (Recommended)
Visit [https://onyx0909.github.io/trading-target-tracker/](https://onyx0909.github.io/trading-target-tracker/) and install as PWA.

### Option 2: Self-Host
1. Clone this repository
2. Serve `index.html` via any web server
3. For cloud sync, configure your own Supabase project

```bash
git clone https://github.com/onyx0909/trading-target-tracker.git
cd trading-target-tracker
# Serve with any static file server
python -m http.server 8000
```

## ⚙️ Configuration

### Daily Target
Default: **0.5%** per day (adjustable in Settings)

| Daily Target | Weekly | Monthly | Yearly |
|--------------|--------|---------|--------|
| 0.5% | ~2.5% | ~11.6% | ~3.5× |
| 1.0% | ~5.1% | ~24.5% | ~12× |
| 1.5% | ~7.7% | ~39.0% | ~40× |

### Buffer System
- Collects profits above daily target
- Automatically covers losses on red days
- Configurable maximum buffer size (default: 10 days)

## 🔧 Tech Stack

- **Frontend**: Vanilla HTML/CSS/JavaScript (single-file architecture)
- **Backend**: Supabase (Auth + PostgreSQL)
- **Hosting**: GitHub Pages
- **PWA**: Service Worker for offline support
- **Charts**: Custom SVG-based visualizations

## 📊 Data Storage

### Local Storage
All data is stored locally in your browser. Export/Import available for backup.

### Cloud Sync (Optional)
- Requires Supabase account
- Google OAuth or Email/Password authentication
- End-to-end encrypted sync

## 🌐 Supported Instruments

Pre-configured instruments:
- XAUUSD (Gold)
- XAGUSD (Silver)
- Custom instruments via calibration

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

### v4.3.3 (Current)
- Fixed: Tooltips now display correctly above form fields
- Fixed: Card overflow issue resolved
- Added: Tomorrow's target preview in daily progress
- Added: text-accent CSS class

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

MIT License - see [LICENSE](LICENSE) file.

## 🙏 Acknowledgments

- Custom SVG icon set (Military Scope design)
- Supabase for backend infrastructure
- All beta testers and contributors

---

**Made with ❤️ for traders who want to compound their way to success.**
