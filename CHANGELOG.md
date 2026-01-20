# Changelog

## [3.5.0] - 2026-01-20 - Kreisdiagramme & UX Verbesserungen

### ✨ Neue Features

**Kreisdiagramme auf Dashboard**
- Heutiger Fortschritt als Kreisdiagramm
- Buffer/Reserve als Kreisdiagramm
- Farbliche Abstufung je nach Fortschritt
- Übersichtlichere Darstellung

**Tagesziel Morgen**
- Zeigt das voraussichtliche Tagesziel für morgen
- Berechnet basierend auf aktuellem Kontostand + heutigem Ziel

**Position löschen - Hinweis**
- Zeigt P/L der Position beim Löschen
- Warnt, dass Gewinn/Verlust im Tageseintrag erfasst sein sollte

---

## [3.4.0] - 2026-01-19 - Exponentielle Projektion

### 🔧 Kritischer Fix

**Ziel-Projektion korrigiert**
- Vorher: Lineare Berechnung (falsch)
- Jetzt: Exponentielle Berechnung mit Zinseszins-Effekt
- Formel: `Tage = log(Ziel/Aktuell) / log(1+Rate)`

---

## [3.3.5] - 2026-01-19 - Phase 2 Complete: Cloud-Sync

### 🎉 Cloud-Sync ist komplett!

Vollständige Synchronisation zwischen allen Geräten (Desktop, iPad, Mobile).

#### ✨ Features

**Onboarding**
- Setup-Dialog bei Erstregistrierung
- Anfangskapital, Zielkapital, Startdatum eingeben

**Branding**
- Neues Logo (Military Scope + Candlesticks)
- Icons in allen Größen (16px - 512px)

**Cloud-Sync (komplett)**
- Profile/Settings synchronisiert
- Instrumente & Kalibrierungen synchronisiert
- Positionen synchronisiert  
- Tageseinträge synchronisiert
- Buffer & Buffer History synchronisiert

#### ⚠️ Bekannte Probleme

- Einige Browser-Erweiterungen können Sync blockieren
- **Lösung:** Inkognito-Modus verwenden

---

## [3.0.0] - 2026-01-18 - Phase 1

### 🚀 Major Release
- Multi-Asset System mit Instrument-Bibliothek
- Buffer/Reserve-System
- Wochen-Tracking mit Fortschrittsanzeige
- Smart Recommendations
- Performance-Varianz Tracking
- Export/Import JSON

---

## Roadmap

### Phase 3 - UX Polish ✅ Abgeschlossen
- [x] Kreisdiagramme
- [x] Tagesziel-Fortschritt auf Dashboard
- [x] Position-Löschen Hinweis
- [x] Tagesziel morgen Anzeige

### Phase 4 - i18n (Internationalisierung)
- [ ] Deutsch (DE) ✓ Basis
- [ ] Englisch (EN)
- [ ] Spanisch (ES)
