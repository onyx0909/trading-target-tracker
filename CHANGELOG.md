# Changelog

## [3.3.5] - 2026-01-19 - Phase 2 Complete: Cloud-Sync

### 🎉 Cloud-Sync ist komplett!

Vollständige Synchronisation zwischen allen Geräten (Desktop, iPad, Mobile).

#### ✨ Neue Features

**Onboarding**
- Setup-Dialog bei Erstregistrierung
- Anfangskapital, Zielkapital, Startdatum eingeben
- Live-Berechnung der geschätzten Dauer

**Branding**
- Neues Logo (Military Scope + Candlesticks)
- Icons in allen Größen (16px - 512px)
- Dark/Light Varianten
- Favicon für Browser-Tab
- Apple Touch Icons für iOS

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
- onConflict Parameter korrigiert
- Trigger für automatische Profil-Erstellung

#### ⚠️ Bekannte Probleme

- Einige Browser-Erweiterungen (Passwort-Manager, AdBlocker) können Sync blockieren
- **Lösung:** Inkognito-Modus oder Erweiterung für diese Seite deaktivieren

---

## [3.1.0] - 2026-01-19 - Phase 2: Cloud-Sync Start

### 🚀 Neu: Supabase Cloud-Sync

#### ✨ Features

**Authentication**
- Email/Passwort Anmeldung
- Google Sign-In (OAuth)
- Automatische Session-Verwaltung
- Offline-Modus weiterhin verfügbar

**Cloud-Sync**
- Echtzeit-Synchronisation aller Daten
- Profile/Settings werden in der Cloud gespeichert
- Daily Logs automatisch synchronisiert
- Instrumente und Kalibrierungen gespeichert
- Positionen synchronisiert

**Offline-First**
- App funktioniert ohne Internet
- Lokale Datenspeicherung als Backup
- Automatischer Sync wenn online
- Sync-Status Anzeige im Header

**UI-Verbesserungen**
- Login/Register Screen
- User Badge im Header
- Sync-Status Indikator (grün/orange/blau)
- Cloud-Sync Karte in Settings

#### 📦 Neue Dateien

- `supabase-schema.sql` - Datenbank-Schema für Supabase

---

## [3.0.1] - 2026-01-19

### 🐛 Behoben
- Datums-Anzeige korrigiert (Zeitzonenproblem)

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

### Phase 3 - UX Polish (nächster Schritt)
- [ ] UI/UX Verbesserungen
- [ ] Performance Optimierung
- [ ] Bessere Fehlerbehandlung
- [ ] Loading States
- [ ] Konfirmations-Dialoge

### Phase 4 - i18n (Internationalisierung)
- [ ] Deutsch (DE) ✓ Basis
- [ ] Englisch (EN)
- [ ] Spanisch (ES)
