# 🎯 Trading Tracker Pro

**Multi-Asset Portfolio & Risk Management PWA**

Eine professionelle Trading-App für Retail Trader zur Verwaltung von dynamischen Tageszielen, Stop/Limit-Berechnung und Performance-Tracking.

![Version](https://img.shields.io/badge/version-3.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-PWA-orange)

---

## ✨ Features

### 📊 Dashboard
- Kontostand und Tages-P/L auf einen Blick
- Wochenübersicht mit Fortschrittsanzeige
- Smart Recommendations (proaktive Empfehlungen)
- Buffer/Reserve-System mit Auto-Use bei Verlusten
- Offene Positionen Übersicht

### 📍 Positionen
- Multi-Instrument Support (Edelmetalle, später Aktien & Forex)
- Automatische Stop-Loss und Take-Profit Berechnung
- P/L pro $1 Bewegung
- Quick Copy für Order-Eingabe

### 🔧 Kalibrierung
- Individuelle Faktor-Kalibrierung pro Instrument
- IBKR-kompatibel (Interactive Brokers)
- Exakte P/L-Berechnung durch Broker-Daten

### 📈 Performance
- Wochen- und Monatsstatistiken
- Ziel-Projektion
- Erfolgsquote und Durchschnitts-P/L

### 🏦 Buffer-System
- Automatisches Sammeln von Überschüssen
- Auto-Use bei Verlusttagen
- Konfigurierbares Maximum (in Tagen)

### 💾 Backup & Restore
- JSON Export/Import
- Plattformübergreifende Datenübertragung

---

## 🚀 Installation

### Als PWA (Progressive Web App)

#### Desktop (Chrome/Edge)
1. Öffne die App im Browser
2. Klicke auf das Install-Icon in der Adressleiste
3. "Installieren" bestätigen

#### iPad/iPhone (Safari)
1. Öffne die App in Safari
2. Tippe auf "Teilen" (⬆️)
3. Wähle "Zum Home-Bildschirm"
4. "Hinzufügen" bestätigen

#### Android (Chrome)
1. Öffne die App in Chrome
2. Tippe auf das Menü (⋮)
3. Wähle "App installieren"

### Selbst hosten

```bash
# Repository klonen
git clone https://github.com/DEIN-USERNAME/trading-tracker-pro.git

# In den Ordner wechseln
cd trading-tracker-pro

# Mit beliebigem Webserver starten
# Beispiel mit Python:
python -m http.server 8000

# Oder mit Node.js:
npx serve
```

---

## 📱 Screenshots

### Dashboard
```
┌─────────────────────────────────────────┐
│  🎯 Trading Tracker Pro                 │
├─────────────────────────────────────────┤
│  €15.365  │  +€841   │  112%  │  €691   │
│  Konto    │  Heute   │  Woche │  Reserve│
├─────────────────────────────────────────┤
│  💡 EMPFEHLUNGEN                        │
│  🎯 Wochenziel erreicht!                │
├─────────────────────────────────────────┤
│  📅 DIESE WOCHE (KW 03)                 │
│  Mo   Di   Mi   Do   Fr                 │
│ +841   -    -    -    -                 │
│  [████████████████░░░░] 112%            │
└─────────────────────────────────────────┘
```

---

## ⚙️ Konfiguration

### Grundeinstellungen

| Einstellung | Beschreibung | Standard |
|-------------|--------------|----------|
| Tagesziel | Prozent vom Kontostand | 1.03% |
| Risiko/Trade | Max. Risiko pro Trade | 2.0% |
| Max. Tagesverlust | Stopp-Trading Limit | 3.0% |
| Risk:Reward | Verhältnis | 1:2 |

### Buffer-System

| Einstellung | Beschreibung | Standard |
|-------------|--------------|----------|
| Aktiviert | Buffer-System nutzen | Ja |
| Auto-Use | Bei Verlust automatisch nutzen | Ja |
| Max. Buffer | Maximum in Tagen | 10 |

---

## 📊 Unterstützte Instrumente

### Phase 1 (Aktuell)
- 🥇 XAUUSD (Gold)
- 🥈 XAGUSD (Silber)
- ⚪ XPTUSD (Platin)
- 🔘 XPDUSD (Palladium)

### Phase 3 (Geplant)
- 📈 Aktien (US, EU)
- 💱 Forex (Majors, Crosses)

---

## 🔧 Kalibrierung

Die App verwendet individuelle Faktoren pro Instrument für exakte P/L-Berechnung.

### So kalibrierst du:

1. Öffne den Tab **🎸 Instrumente**
2. Klicke auf das gewünschte Instrument
3. Gib die Werte aus deinem Broker-Screenshot ein:
   - Position Size
   - Average Price
   - Current Price
   - Unrealisierter P/L (€)
4. Klicke **Faktor speichern**

### Formel
```
Faktor = P/L (€) ÷ (Preisdifferenz × Position Size)
```

### Beispiel XAUUSD
```
P/L = 18€
Preisdiff = 1.065$ (4595.68 - 4594.615)
Size = 10

Faktor = 18 ÷ (1.065 × 10) = 1.69 EUR/Einheit/$1
```

---

## 💾 Datenstruktur

Die App speichert alle Daten lokal im Browser (LocalStorage).

```javascript
{
  version: "3.0.0",
  settings: { ... },
  instruments: { ... },
  positions: [ ... ],
  dailyLogs: [ ... ],
  buffer: { ... }
}
```

### Backup erstellen
1. Gehe zu **⚙️ Settings**
2. Klicke **📤 Daten exportieren**
3. JSON-Datei wird heruntergeladen

### Backup wiederherstellen
1. Gehe zu **⚙️ Settings**
2. Klicke **📥 Daten importieren**
3. Wähle die JSON-Backup-Datei

---

## 🛣️ Roadmap

- [x] Phase 1: Multi-Asset Basis, Buffer-System, Recommendations
- [ ] Phase 2: Cloud-Sync (Supabase)
- [ ] Phase 3: Aktien & Forex Support
- [ ] Phase 4: Dark/Light Mode, Animationen
- [ ] Phase 5: Mehrsprachigkeit (DE/EN/ES)
- [ ] Phase 6: Premium Features & Monetarisierung
- [ ] Phase 7: IBKR API Integration

---

## 🤝 Contributing

Beiträge sind willkommen! Bitte erstelle einen Pull Request oder öffne ein Issue.

---

## 📄 Lizenz

MIT License - siehe [LICENSE](LICENSE)

---

## ⚠️ Disclaimer

**Trading Tracker Pro ist ein Tool zur Organisation und Verwaltung von Trading-Aktivitäten. Es stellt keine Anlageberatung dar.**

Der Handel mit Finanzinstrumenten birgt erhebliche Risiken und kann zum Verlust des eingesetzten Kapitals führen. Vergangene Performance ist keine Garantie für zukünftige Ergebnisse.

---

## 📧 Kontakt

- GitHub Issues: [Issues](https://github.com/DEIN-USERNAME/trading-tracker-pro/issues)

---

Made with ❤️ for Traders
