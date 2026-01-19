# Changelog

## [3.4.1] - 2026-01-19 - UX Verbesserungen

### ✨ Neue Features

**Heutiger Fortschritt auf Dashboard**
- Tagesziel mit Fortschrittsbalken
- Zeigt realisiertes P/L vs. Ziel
- Farbliche Abstufung (blau → gold → grün)
- "Noch X bis zum Ziel" Anzeige

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

**Neue Dashboard-Anzeige**
- Heutiges Tagesziel angezeigt
- Ca. Jahre zusätzlich zu Monaten
- Fortschritt zum Gesamtziel

---

## [3.3.5] - 2026-01-19 - Phase 2 Complete: Cloud-Sync

### 🎉 Cloud-Sync ist komplett!

Vollständige Synchronisation zwischen allen Geräten (Desktop, iPad, Mobile).

#### ✨ Features

**Onboarding**
- Setup-Dialog bei Erstregistrierung
- Anfangskapital, Zielkapital, Startdatum eingeben
- Live-Berechnung der geschätzten Dauer

**Branding**
- Neues Logo (Military Scope + Candlesticks)
- Icons in allen Größen (16px - 512px)
- Dark/Light Varianten

**Cloud-Sync (komplett)**
- Profile/Settings synchronisiert
- Instrumente & Kalibrierungen synchronisiert
- Positionen synchronisiert  
- Tageseinträge synchronisiert
- Buffer & Buffer History synchronisiert

#### 🔧 Bug Fixes

- Profil-Duplikate bei Registrierung behoben
- Position-Sync korrigiert (DELETE + INSERT)
- Buffer History wird jetzt gespeichert
- RLS Policies für alle Tabellen optimiert

#### ⚠️ Bekannte Probleme

- Einige Browser-Erweiterungen (Passwort-Manager, AdBlocker) können Sync blockieren
- **Lösung:** Inkognito-Modus oder Erweiterung für diese Seite deaktivieren

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

### Phase 3 - UX Polish ✅ In Arbeit
- [x] Tagesziel-Fortschritt auf Dashboard
- [x] Position-Löschen Hinweis
- [ ] Loading States
- [ ] Bessere Fehlerbehandlung

### Phase 4 - i18n (Internationalisierung)
- [ ] Deutsch (DE) ✓ Basis
- [ ] Englisch (EN)
- [ ] Spanisch (ES)
