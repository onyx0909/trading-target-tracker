# 🎯 TargetTrader

**Professional Trading Target Tracker with Cloud Sync**

A sleek, military-inspired web application to track your daily trading targets, manage positions, and monitor your progress towards financial goals.

![Version](https://img.shields.io/badge/version-4.3.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Web%20%7C%20PWA-orange)

---

## ✨ Features

### 📊 Dashboard
- **Real-time P/L tracking** - See your daily, weekly, and total performance at a glance
- **Dynamic daily targets** - Compound growth based on your balance (default 1.03%)
- **Visual progress indicators** - Circular progress charts for daily goals
- **Streak tracking** - Monitor consecutive profitable days
- **Mini equity curve** - 7-day performance visualization

### 💼 Position Management
- **Open positions tracking** - Monitor all active trades with live P/L
- **Intraday closed trades** - Log trades as you close them (NEW in v4.3.0!)
- **SL/TP calculator** - Automatic stop-loss and take-profit levels based on risk settings
- **Quick copy** - Instant access to instrument symbols

### 📈 Instruments
- **Multi-instrument support** - Gold (XAUUSD), Silver (XAGUSD), indices, forex, crypto
- **Broker calibration** - Calculate exact P/L factors for your specific broker
- **Custom instruments** - Add any tradeable asset

### 🏦 Smart Buffer System
- **Automatic surplus allocation** - Excess profits go to reserve
- **Loss protection** - Buffer covers losing days automatically
- **Configurable limits** - Set maximum buffer days

### ☁️ Cloud Sync (Supabase)
- **Multi-device support** - Access from desktop, tablet, or phone
- **Real-time sync** - Changes sync instantly across devices
- **Offline mode** - Works without internet, syncs when back online
- **Secure authentication** - Email/password login

### 🌍 Internationalization
- **German** (Deutsch)
- **English**
- **Spanish** (Español)

---

## 🚀 Quick Start

### Option 1: GitHub Pages (Recommended)
Visit: **https://onyx0909.github.io/trading-target-tracker/**

### Option 2: Local Installation
```bash
git clone https://github.com/onyx0909/trading-target-tracker.git
cd trading-target-tracker
# Open index.html in your browser
```

### Option 3: Self-Hosted with Cloud Sync
1. Clone the repository
2. Set up a [Supabase](https://supabase.com) project
3. Run the SQL migrations (see `/docs/supabase-setup.md`)
4. Update the Supabase credentials in `index.html`
5. Deploy to your preferred hosting

---

## 📱 PWA Support

TargetTrader is a Progressive Web App! Install it on your device:

- **iOS**: Safari → Share → Add to Home Screen
- **Android**: Chrome → Menu → Install App
- **Desktop**: Chrome → Address bar → Install icon

---

## 🛠️ Configuration

### Initial Setup (Onboarding)
1. Set your **starting capital**
2. Set your **target capital** (goal)
3. Configure **daily target %** (default: 1.03%)
4. Set **risk per trade %** (default: 2%)
5. Configure **R:R ratio** (default: 2:1)

### Instrument Calibration
For accurate P/L calculations, calibrate each instrument:
1. Go to **Instruments** tab
2. Click **Calibrate** on an instrument
3. Enter position details from your broker
4. The app calculates your exact P/L factor

---

## 📋 Version History

### v4.3.0 - Intraday Closed Trades (Latest)
- Track closed trades during the day before broker statement
- Real-time P/L updates across all views
- Full Supabase cloud sync for intraday trades

### v4.2.0 - Custom Icon System
- 25+ custom SVG icons (no emojis)
- Military scope design language
- Improved SL/TP styling

### v4.1.0 - TargetTrader Branding
- New logo and app identity
- Updated favicon and manifest

### v4.0.0 - Cloud Sync
- Supabase integration
- Multi-device support
- User authentication

[Full changelog →](CHANGELOG.md)

---

## 🗄️ Database Schema (Supabase)

```
profiles          - User settings & preferences
instruments       - Trading instruments configuration
positions         - Open positions
daily_logs        - Daily trading entries
intraday_closed_trades - Same-day closed trades (v4.3.0+)
```

See `supabase-migration-v4.3.0.sql` for the latest schema.

---

## 🎨 Design Philosophy

TargetTrader uses a **military tactical scope** design language:
- Dark theme optimized for extended screen time
- High-contrast accent colors (gold, green, red)
- Minimal, functional UI
- Custom SVG iconography
- No emoji dependencies

---

## 🔒 Privacy & Security

- **No tracking** - Zero analytics or telemetry
- **Local-first** - Works entirely offline
- **Your data** - Cloud sync is optional, data stays in your Supabase
- **Row-level security** - Each user can only access their own data

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📄 License

MIT License - feel free to use this for your own trading journey!

---

## ⚠️ Disclaimer

This application is for tracking purposes only. It does not provide financial advice. Trading involves substantial risk of loss. Past performance is not indicative of future results. Always trade responsibly.

---

<p align="center">
  <strong>Built with ❤️ for traders who take their targets seriously</strong>
</p>
