# Spotify mit Jarvis verbinden (einmalig, ca. 3 Minuten)

Damit Jarvis Lieder selbst abspielen kann, braucht er eine eigene kleine „Spotify-App“.
Die legst nur du an, weil sie an dein Spotify-Konto gebunden ist. Voraussetzung: Spotify Premium (hast du).

## 1. App anlegen
1. Öffne https://developer.spotify.com/dashboard und melde dich mit deinem Spotify-Konto an.
2. Beim ersten Mal: Nutzungsbedingungen für Entwickler lesen und akzeptieren.
3. Klicke auf **Create app** und fülle aus:
   - **App name:** `Jarvis`
   - **App description:** `Persönlicher Sprachassistent`
   - **Redirect URI:** genau `http://127.0.0.1:8778/callback` eintragen und auf **Add** klicken
     (wichtig: `127.0.0.1`, nicht `localhost`, das erlaubt Spotify nicht mehr)
   - Bei **Which API/SDKs are you planning to use?** das Häkchen bei **Web API** setzen
4. Speichern.

## 2. Client-ID kopieren
- In der App auf **Settings** gehen und die **Client ID** kopieren (eine lange Buchstaben-/Zahlenfolge).
- Das **Client Secret** brauchst du **nicht**. Bitte nirgends eintragen oder weitergeben.

## 3. Client-ID eintragen
Entweder schickst du mir die Client-ID im Chat, dann trage ich sie ein (sie ist kein Passwort),
oder du trägst sie selbst in `assistent/config.py` ein:
```
SPOTIFY_CLIENT_ID = "hier-deine-client-id"
```

## 4. Anmelden
Im Ordner `D:\JARVIS` ausführen:
```
.venv\Scripts\python -m assistent.spotify
```
Der Browser öffnet sich, du meldest dich bei Spotify an und bestätigst den Zugriff.
Danach steht im Terminal „Verbunden mit dem Spotify-Konto von …“. Fertig.
Die Anmeldung wird in `daten/spotify-anmeldung.json` gespeichert und erneuert sich selbst.

## Was Jarvis damit darf
Nur: sehen, was gerade läuft, Wiedergabe steuern und deine Playlists lesen.
Nichts löschen, nichts kaufen, keine Playlists verändern.
