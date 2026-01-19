# Changelog

## [3.1.0] - 2026-01-19 - Phase 2: Cloud-Sync

### 🚀 Neu: Supabase Cloud-Sync

Diese Version fügt vollständige Cloud-Synchronisation hinzu!

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

#### 🔧 Technisch

- Supabase Client integriert
- Row Level Security (RLS) für Datenisolation
- Automatische Profil-Erstellung bei Signup
- Conflict Resolution bei Sync

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
