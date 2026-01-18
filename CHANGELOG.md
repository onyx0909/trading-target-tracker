# Changelog

Alle wichtigen Änderungen werden hier dokumentiert.

Format basiert auf [Keep a Changelog](https://keepachangelog.com/de/1.0.0/).

---

## [2.0.0] - 2026-01-18

### ✨ Hinzugefügt
- **Realisiert vs. Offen P/L**: Separate Erfassung von geschlossenen und offenen Trades
- **Overnight-Position Tracking**: Erfassung von Overnight-Positionen mit Instrument, Richtung und Lots
- **Live-Vorschau**: Echtzeit-Berechnung beim Eintragen
- **Bottom Navigation**: Mobile-optimierte Tab-Navigation
- **Safe Area Support**: Optimiert für iPhone Notch/Home-Indicator
- **Erweiterte Statistiken**: Separate Quoten für realisiert vs. gesamt

### 🔄 Geändert
- Komplettes UI-Redesign für Mobile-First
- Tagesziel-Status basiert auf **realisiertem** P/L (nicht gesamt)
- Verbesserte Farbgebung und Kontraste
- Optimierte Touch-Targets

### 🐛 Behoben
- iOS Safari: Kein Zoom mehr bei Input-Fokus
- Überscroll-Verhalten auf iOS
- Service Worker Caching-Probleme

---

## [1.0.0] - 2026-01-17

### ✨ Hinzugefügt
- Initiale Version
- Dynamische Tagesziele basierend auf Kapital
- Compound-Wachstum Berechnung
- Meilenstein-Tracking
- Lokale Datenspeicherung (localStorage)
- PWA-Grundfunktionen

---

## Geplant

### [2.1.0]
- Export/Import (JSON/CSV)
- Erweiterte Statistiken

### [2.2.0]
- Multi-Account Support
- Charts
