# 🎯 Trading Target Tracker Pro

Eine Progressive Web App (PWA) für dynamische Trading-Tagesziele mit Compound-Wachstum und vollständigem P/L-Tracking.

![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![PWA](https://img.shields.io/badge/PWA-ready-purple.svg)
![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20Android%20%7C%20Web-lightgrey.svg)

---

## ✨ Features

### 📊 Dynamische Tagesziele
- Tagesziele skalieren automatisch mit dem Kontostand
- Basierend auf prozentualem Tages-Renditeziel (Standard: 1,03%)
- Compound-Wachstum-Berechnung

### 💰 Realisiert vs. Offen P/L
- Separate Erfassung von realisierten und unrealisierten Gewinnen/Verlusten
- Klare Unterscheidung: Nur realisierte Gewinne zählen für das Tagesziel
- Overnight-Position-Tracking mit Instrumenten-Details

### 📈 Umfassende Statistiken
- Gewinnrate und Ziel-Erreichungsrate
- Historische Performance-Übersicht
- Fortschritts-Tracking zum Endziel
- Meilenstein-Übersicht

### 📱 Mobile-First Design
- Optimiert für iPad, iPhone und Android
- Vollbild-App-Modus (keine Browser-Leiste)
- Offline-Funktionalität
- Touch-optimierte Bottom-Navigation

---

## 🚀 Quick Start

### Option 1: GitHub Pages (empfohlen)

1. **Fork** dieses Repository
2. Gehe zu **Settings → Pages**
3. Wähle **Source: "Deploy from a branch"**
4. Wähle **Branch: "main"** und **Folder: "/ (root)"**
5. Klicke **Save**
6. Deine App ist in ~2 Minuten verfügbar unter:
   ```
   https://DEIN-USERNAME.github.io/trading-target-tracker/
   ```

### Option 2: Lokal nutzen

Einfach `index.html` im Browser öffnen - fertig!

---

## 📱 Installation auf Mobilgeräten

### iOS (iPhone/iPad)

1. Öffne die App-URL in **Safari**
2. Tippe auf das **Teilen-Symbol** (⬆️)
3. Wähle **"Zum Home-Bildschirm"**
4. Bestätige mit **"Hinzufügen"**

### Android

1. Öffne die App-URL in **Chrome**
2. Tippe auf das **Menü** (⋮)
3. Wähle **"Zum Startbildschirm hinzufügen"**

---

## 📖 Täglicher Workflow

### Morgens
- Dashboard öffnen → Tagesziel sehen
- Bei offenen Positionen: Overnight-Warning beachten

### Abends
1. Gehe zu **"Eintrag"**
2. Trage ein:
   - **Realisierter P/L**: Alle geschlossenen Trades
   - **Offener P/L**: Unrealisierte Positionen
   - **Overnight**: Falls Positionen gehalten werden
3. **Speichern**

---

## ⚙️ Standard-Einstellungen

| Parameter | Standardwert | Beschreibung |
|-----------|--------------|--------------|
| Startkapital | €14.528 | Dein Anfangskapital |
| Zielkapital | €1.250.000 | Dein Endziel |
| Tagesziel | 1,03% | Tägliche Rendite-Erwartung |
| Erfolgsquote | 75% | Erwartete Gewinn-Tage |

Alle Werte können in **Settings** angepasst werden.

---

## 🔧 Technische Details

- **Frontend**: Vanilla HTML5, CSS3, JavaScript (ES6+)
- **Storage**: localStorage (100% lokal)
- **PWA**: Service Worker für Offline-Support
- **Keine Abhängigkeiten**: Läuft standalone

### Datenschutz
- ✅ Keine Cloud-Synchronisation
- ✅ Keine Datenübertragung
- ✅ Keine Tracking/Analytics
- ✅ Alle Daten bleiben auf deinem Gerät

---

## 📁 Projektstruktur

```
trading-target-tracker/
├── index.html          # Hauptanwendung
├── manifest.json       # PWA-Konfiguration
├── sw.js              # Service Worker
├── icon-192.png       # App-Icon (192x192)
├── icon-512.png       # App-Icon (512x512)
├── README.md          # Diese Datei
├── LICENSE            # MIT-Lizenz
└── CHANGELOG.md       # Versionshistorie
```

---

## 🛣️ Roadmap

### v2.1 (geplant)
- [ ] Export/Import von Daten (JSON/CSV)
- [ ] Erweiterte Statistiken

### v2.2 (geplant)
- [ ] Multi-Account Support
- [ ] Chart-Visualisierungen

### v3.0 (Zukunft)
- [ ] Optionale Cloud-Sync
- [ ] Broker-API Integration

---

## 📄 Lizenz

MIT License - siehe [LICENSE](LICENSE)

---

## ⚠️ Disclaimer

Diese App dient zu **Tracking-Zwecken** und stellt keine Finanzberatung dar. Trading birgt erhebliche Risiken.

---

**Viel Erfolg beim Trading! 🚀📈**
