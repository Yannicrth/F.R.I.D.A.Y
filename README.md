# JARVIS

Lokaler deutscher Sprachassistent für Windows mit dem „Nebel“ als Oberfläche (Desktop-Hintergrund auf dem oberen Monitor).
Alles läuft auf dem eigenen Rechner: Qwen 3.5 über Ollama zum Denken, Whisper zum Hören, Qwen3-TTS als Stimme.

Was er kann und wie der Stand ist: [STAND.md](STAND.md). Offene und erledigte Wünsche: [WUENSCHE.md](WUENSCHE.md).
Persönlichkeit und Infos über Hiro und die Projekte: [PERSOENLICHKEIT.md](PERSOENLICHKEIT.md), [PROJEKTE.md](PROJEKTE.md).

## Auf einem neuen Rechner einrichten

Voraussetzungen: Windows, Python 3.12, eine NVIDIA-Grafikkarte (getestet mit RTX 3080, 10 GB), [Ollama](https://ollama.com).

```bash
python -m venv .venv
.venv\Scripts\python -m pip install torch==2.11.0 torchaudio==2.11.0 --index-url https://download.pytorch.org/whl/cu128
.venv\Scripts\python -m pip install -r requirements.txt
.venv\Scripts\python -m assistent.modelle_laden
ollama pull qwen3.5:4b
ollama pull qwen3.5:9b
```

Danach rechnerbezogene Einstellungen in `assistent/config.py` prüfen (Steam-Ordner, Monitor für den Hintergrund, Mikrofon).

## Starten

- `JARVIS-starten.bat` doppelklicken, oder
- `.venv\Scripts\python -m assistent.jarvis` (Nebel als Desktop-Hintergrund), `--browser` für die Ansicht im Browser.
- Selbsttest zum Zuschauen: `.venv\Scripts\python -m assistent.selbsttest`

## Nicht im Repository

- `modelle/` (ca. 11 GB, lädt `assistent.modelle_laden` neu)
- `daten/` außer `gedaechtnis.json` (Gesprächsprotokolle, Kalender, Notizen, Anmeldungen bei Spotify/Twitch, Browserprofil)
- `.venv/`, die Kopie des eigenen Hintergrundbilds und die ausprobierten Stimmen-Kandidaten

Spotify und Twitch werden auf jedem Rechner neu verbunden: [SPOTIFY-EINRICHTEN.md](SPOTIFY-EINRICHTEN.md), [TWITCH-EINRICHTEN.md](TWITCH-EINRICHTEN.md).
