# Twitch mit Jarvis verbinden (einmalig, ca. 5 Minuten)

Damit Jarvis dir zeigen kann, wer gerade live ist („Was läuft auf Twitch?“), braucht er eine kleine eigene
„Twitch-App“. Die legst du an, weil sie an dein Twitch-Konto gebunden ist.
**Einen Stream per Namen öffnen („Öffne Trymacs“) klappt auch ohne diese Einrichtung.**

## 1. Voraussetzung
Twitch verlangt für Entwickler-Apps die **Zwei-Faktor-Anmeldung** (2FA) auf deinem Konto.
Falls noch nicht aktiv: twitch.tv → Einstellungen → Sicherheit und Privatsphäre → Zwei-Faktor-Authentifizierung.

## 2. App anlegen
1. Öffne https://dev.twitch.tv/console und melde dich mit deinem Twitch-Konto an.
2. **Anwendungen** → **Deine Anwendung registrieren** (Register Your Application).
3. Ausfüllen:
   - **Name:** etwas Eindeutiges, z. B. `Jarvis-Hiro` (muss auf Twitch einmalig sein)
   - **OAuth-Weiterleitungs-URL:** `http://localhost` (wird nicht benutzt, Twitch verlangt aber eine)
   - **Kategorie:** `Application Integration`
   - **Client-Typ:** **Öffentlich** (Public) ← wichtig, dann braucht Jarvis kein Geheimnis
4. Erstellen, dann bei der App auf **Verwalten** und die **Client-ID** kopieren.

## 3. Client-ID eintragen
Schick mir die Client-ID im Chat (sie ist kein Passwort), oder trag sie selbst in `assistent/config.py` ein:
```
TWITCH_CLIENT_ID = "hier-deine-client-id"
```

## 4. Anmelden
Im Ordner `D:\JARVIS` ausführen:
```
.venv\Scripts\python -m assistent.twitch
```
Jarvis zeigt einen Code und öffnet twitch.tv/activate. Dort anmelden und den Code bestätigen. Fertig.

## Was Jarvis damit darf
Nur **lesen, welchen Kanälen du folgst** (und öffentliche Infos wie Zuschauerzahl, Spiel, Titel).
Kein Chatten, kein Folgen/Entfolgen, nichts kaufen, nichts ändern.
Die Anmeldung erneuert sich selbst; wenn Jarvis 30 Tage nicht benutzt wird, einmal neu anmelden.
