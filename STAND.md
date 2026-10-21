# Stand (19./20.10.2026, Nacht)

## Fertig
- **Visuelle Grundform**: `spielwiese/index.html` (Sicherung `spielwiese/grundform-v6.html`), Start über `spielwiese/start.bat`.
- **Python 3.12.10** mit Projektumgebung `.venv` (Pakete: ollama, pycaw, comtypes, psutil).
- **Ollama 0.40.5** installiert, läuft als Hintergrunddienst.
- **Modelle**: `qwen3.5:9b` (gewählt) und `gemma4:12b-it-qat` (Alternative), beide heruntergeladen.
- **Grundgerüst** im Ordner `assistent/`:
  - `config.py`: Name, Modell, Gedächtnis (6 Runden), Kontext (8192), Webseiten-Kurznamen, Programm-Aliase
  - `werkzeuge.py`: feste Werkzeugliste (keine beliebigen Befehle):
    Programm starten (alle 306 Startmenü-Apps inkl. Spotify, OBS, VS Code), Steam-Spiel starten (40 installierte Spiele),
    Webseite öffnen, Websuche (Google/YouTube), Spotify-Suche, Musik steuern (Play/Pause/Weiter/Zurück),
    Lautstärke, Uhrzeit/Datum. Namenssuche verträgt Tippfehler und Satzzeichen („spotfy“ → Spotify, „repo“ → R.E.P.O.).
  - `gehirn.py`: Gespräch mit dem Modell, Werkzeuge ausführen, Denkmodus aus, Emojis/Markdown werden fürs Vorlesen entfernt
  - `chat.py`: Text-Chat zum Ausprobieren
  - `benchmark.py`: Modellvergleich mit 26 deutschen Testaufgaben

## Ausprobieren (im Ordner D:\JARVIS)
```
.venv\Scripts\python -m assistent.chat --probe     (zeigt nur, was passieren würde)
.venv\Scripts\python -m assistent.chat             (führt wirklich aus!)
.venv\Scripts\python -m assistent.benchmark        (Modellvergleich → benchmark-ergebnis.md)
```

## Modellvergleich → Entscheidung: Qwen 3.5 9B
| | Qwen 3.5 9B | Gemma 4 12B |
|---|---|---|
| Richtig (26 Aufgaben × 2) | 52/52 | 52/52 |
| Antwortzeit (Median) | **0,8 s** | 1,1 s |
| Mehrfachbefehl (2 Werkzeuge) | **1,7 s** | 5,6 s |
| Grafikspeicher | **5,6 GB** | 7,7 GB |
| Erstes Laden | **5 s** | 41 s |
| Stil | gelegentlich zu lang / Emoji | **kürzer, sauberer** |

Ausschlaggebend: Grafikspeicher. Mit Gemma bleibt kein Platz für Spracherkennung und Sprachausgabe.
Volle Tabelle mit allen Antworten: `benchmark-ergebnis.md`.

## Was beim Testen gefunden und behoben wurde
1. **Anweisung entscheidend**: Mit „antworte kurz in zwei Sätzen“ zuerst hat Qwen Aktionen nur *behauptet*
   (0 von 4 Werkzeugaufrufen, sogar eine erfundene Uhrzeit). Werkzeug-Zwang an den Anfang gestellt → 4/4.
2. **Ollama-Fehler bei Qwen**: Das zweite Argument wird manchmal kaputt ausgelesen (`'': 'wert>\n20'`).
   Wird jetzt automatisch repariert.
3. **Absturz in längeren Gesprächen** („XML syntax error“): Das Modell hat seine eigenen kaputten Aufrufe
   aus dem Verlauf nachgemacht. Jetzt landen nur bereinigte Aufrufe im Verlauf, plus automatische Wiederholung.
   Danach: 54 Gesprächsrunden ohne Fehler.
4. **Lange Gespräche**: Nach vielen Runden hat Qwen einmal „Die Uhrzeit wird angezeigt“ gesagt, ohne nachzusehen.
   Verlauf wird jetzt auf 6 Runden gekürzt → danach fehlerfrei.
5. Folgefragen funktionieren („und jetzt lauter“, „noch mal“, „ach nee, doch lieber Valheim“).

## Live-Tests am 20.10.2026 (`python -m assistent.selbsttest`, zum Zuschauen im Terminal)
Ergebnis nach Korrekturen: **27/27**, Antwortzeit ca. 0,9 s. Gefunden und behoben:
- Ollama war nach dem PC-Start noch nicht bereit (Update auf 0.40.6) → Jarvis wartet jetzt bzw. startet Ollama selbst
- **Im normalen Terminal wurden gar keine Programme gefunden** (Zeichenkodierung der Programmliste) → behoben
- „Mach lauter“ kam mit `wert=0` an → lauter/leiser ist jetzt immer mindestens 10 %
- Uhrzeit in langen Gesprächen „vergessen“ → Datum/Uhrzeit stehen jetzt bei jeder Anfrage in der Anweisung
- „Was kannst du?“ war eine 768-Zeichen-Liste → jetzt max. zwei Sätze
- **Jarvis hat einen Fehlschlag schöngeredet** („YouTube geöffnet“, obwohl nichts passiert war) →
  Programm-Werkzeug öffnet bekannte Webseiten jetzt selbst, und Fehlschläge müssen ehrlich gemeldet werden (eigener Test dafür)

## Musik (20.10.2026)
- **Spotify-Anbindung gebaut** (`assistent/spotify.py`, spotipy 2.26, sichere Anmeldung ohne Geheimnis/PKCE):
  Lied, Künstler, Album oder Playlist (auch eigene) direkt abspielen; startet Spotify selbst, wenn kein Gerät aktiv ist.
  **Wartet auf dich:** Spotify-App anlegen und anmelden, siehe `SPOTIFY-EINRICHTEN.md`.
  Bis dahin öffnet Jarvis nur die Spotify-Suche und sagt das auch.
  Hinweis: Seit Feb. 2026 braucht der App-Besitzer Premium; Suche liefert max. 10 Treffer.
- **„Was läuft gerade?“** fragt Windows direkt (`assistent/medien.py`): kennt Spotify, YouTube/Twitch im Browser,
  VLC usw., ohne Anmeldung. Liefert auch Position und Länge, Grundlage für den Player im Nebel.
- Live-Test: **33/33**. „Spiel Blinding Lights“ wurde zuerst als Videospiel verstanden → Werkzeugbeschreibungen geschärft,
  beide Richtungen getestet („Spiel Bohemian Rhapsody“ = Musik, „Spiel Valheim“ = Spiel).

## Verbindung zur Oberfläche: Anzeigen im Nebel (20.10.2026)
**Start:** Doppelklick auf `JARVIS-starten.bat` (oder `.venv\Scripts\python -m assistent.jarvis`, mit `--probe` als Probelauf).
Öffnet den Nebel im Browser und den Chat im Fenster.
- `assistent/bruecke.py`: lokale WebSocket-Verbindung (Port 8779). Nimmt nur Verbindungen von der eigenen Oberfläche an
  (getestet: fremde Webseite wird abgewiesen). Von der Oberfläche sind nur feste Befehle erlaubt: Lautstärke, Stumm, Player-Tasten.
- `assistent/jarvis.py`: Hauptprogramm (liefert die Oberfläche auf Port 8777 aus, startet Brücke und Chat)
- `spielwiese/anzeigen.js`: Anzeigen im Nebel, tauchen unscharf auf und verwehen wieder, leuchten in der Farbwelt
  - **Lautstärke**: erscheint bei Lautstärkebefehlen **und** wenn du an den Lautstärketasten drehst. Regler ziehen, klicken,
    Mausrad, Stumm-Taste → stellt die echte Windows-Lautstärke (getestet)
  - **Player**: erscheint bei Musikbefehlen und bei jedem Liedwechsel: Cover, Titel, Künstler, Programm, Fortschritt
    (bei Livestreams „LIVE“), Tasten Zurück / Play-Pause / Weiter
  - **Uhr**: erscheint, sobald Jarvis die Uhrzeit nennt
  - **Untertitel**: Jarvis' Antwort unter dem Gesicht (bis die Stimme kommt)
  - **Zustände**: Figur wechselt automatisch zwischen Denkt → Spricht → Ruhe
  - Testtasten ohne Jarvis: L (Lautstärke), K (Uhr), P (Player)
  - **Plätze (Wunsch 20.10.):** jede Anzeige hat ihren eigenen Platz, nichts rutscht nach:
    Player unten links, Lautstärke unten rechts, Uhr oben rechts, Untertitel unter dem Gesicht.
    **Taste A** (oder Menü → Anzeigen → Anordnen): Anzeigen mit der Maus verschieben, wird gespeichert;
    „Standardplätze“ setzt zurück.
  - **Nichts springt:** Anzeigen tauchen aus Richtung Gesicht auf und verwehen dorthin; Lautstärkezahl, Regler und
    Fortschrittsbalken gleiten; Titel, Künstler, Uhrzeit und Untertitel werden überblendet, Cover ebenfalls.
    Eine neu geöffnete Oberfläche bekommt sofort den aktuellen Player samt Cover.
- Gefunden und behoben: Beobachter hing still fest (Windows-Audio und Medienabfrage im selben Thread) → getrennt,
  mit Fehlerschutz; Anzeigen liefen unten aus dem Bild → fester Bereich zwischen Augen und Untertitel, Verkleinerung
  bei kleinen Bildschirmen; Regler blieb nach dem Ziehen für immer sichtbar → behoben.
- **Später beim eigenen Fenster (Electron) beachten:** Das Fenster soll durchklickbar sein, die Anzeigen aber bedienbar
  → Klicks nur dort abfangen, wo gerade eine Anzeige ist.

## Wetter (20.10.2026)
- `assistent/wetter.py`: Open-Meteo (kostenlos, ohne Anmeldung, Quelle wird angezeigt), Vorhersage 8 Tage, stündlich.
  **Ort:** genannter Ort → gespeicherter Wohnort („Ich wohne in …“ → Werkzeug `wohnort_merken`, Datei `daten/einstellungen.json`)
  → automatisch über die Internetadresse (ungenau: ein Dienst sagt Düsseldorf, der andere Leverkusen) → sonst fragt Jarvis nach.
  Tage: heute, morgen, übermorgen, Wochentage.
- `spielwiese/wetter.js`: Wetteranzeige oben links (verschiebbar) mit Symbol, Temperatur, Beschreibung, Details,
  Temperaturkurve mit Regenbalken. **Zeitraffer:** Tag läuft stündlich durch (0,55 s/Stunde, heute ab jetzt, sonst ab 6 Uhr),
  Uhr zählt mit, Lichtpunkt wandert über die Kurve, danach Tageszusammenfassung.
  **Animationen im Nebel:** Regen (Niesel bis Starkregen, schräg), Schnee, Sonne mit drehenden Strahlen, Mondlicht,
  Wolken, Nebelbänke, Gewitter mit Blitz (Nebel leuchtet mit), Himmelsschimmer bei Tag und Dämmerung. Alles blendet
  weich über; ohne Wetteranzeige ruht die Animation komplett. Testtaste **N**: Testtag mit allen Wetterarten.
- Getestet mit echten Daten (Düsseldorf morgen, Hamburg jetzt) und im Selbsttest: **37/37**.

## Twitch und YouTube (20.10.2026)
- Player zeigt bei Browsern die **Seite** statt „Chrome“: Jarvis liest über die Windows-Barrierefreiheit (UI Automation)
  den Namen des Tabs, der gerade Ton abspielt („Trymacs - Twitch – Audiowiedergabe“ → Twitch). Nur dieser Tab zählt,
  andere Tab-Namen werden nicht gespeichert. ~1 s, nur bei neuem Titel; nach Fehlschlag 30 s Pause.
- **Eigene Anzeige für Twitch und YouTube** (`spielwiese/stream.js`), unten links (Musik-Player sitzt darüber):
  - Twitch: lila, rundes Streamer-Bild mit Leuchtring, LIVE-Punkt, Streamer, Stream-Titel, „seit X Min.“ (seit Jarvis zuschaut), Pause
  - YouTube: rot, Vorschaubild, Titel (2 Zeilen), Kanal, Fortschritt, Zurück/Play/Weiter; bei YouTube-Livestreams LIVE
  - Wechsel Musik ↔ Twitch ↔ YouTube: Anzeigen überblenden, gleiche Höhe, nichts springt
  - Testtasten T (Twitch), Y (YouTube). Später möglich: Zuschauerzahl/Kategorie über die offizielle Twitch-Schnittstelle (braucht Freischaltung).

## Twitch-Übersicht (20.10.2026)
- „Was läuft auf Twitch?“ → Übersicht oben in der Mitte (verschiebbar): bis zu 4 Karten (Vorschaubild, LIVE, Zuschauer,
  Laufzeit, Profilbild, Name, Spiel, Titel), Karten tauchen nacheinander auf; weitere Kanäle als Zeile darunter.
  „Wer streamt gerade League?“ → dasselbe für eine Kategorie (deutsche Streams zuerst).
- „Öffne Trymacs“ / Klick auf eine Karte → Karte leuchtet auf, Rest verblasst, Übersicht verweht, Stream öffnet im Browser.
  Öffnen per Name klappt auch ohne Twitch-Verbindung.
- `assistent/twitch.py` (offizielle Helix-Schnittstelle, Anmeldung per Code ohne App-Geheimnis, nur Leserecht auf gefolgte
  Kanäle). **Wartet auf dich:** `TWITCH-EINRICHTEN.md`. Bis dahin sagt Jarvis ehrlich, dass Twitch nicht verbunden ist.
- `spielwiese/twitch.js`; Testtasten O (Übersicht mit Beispielkanälen), I (Auswahl-Animation).
- Getestet: 12/12 (inkl. Unterscheidung „Was läuft gerade?“ ↔ „Was läuft auf Twitch?“). Echte Abfrage erst nach Freischaltung testbar.
- Selbsttest kann jetzt gefiltert werden: `.venv\Scripts\python -m assistent.selbsttest twitch` (nur passende Aufgaben, je 2×).

## Spielmodus (20.10.2026, getestet mit laufendem League of Legends)
- `assistent/spielmodus.py`: erkennt Spiele alle 3 s: Programm aus einem Spieleordner (Steam-Bibliotheken, Riot, Epic,
  GOG, EA, Ubisoft, Xbox oder `SPIELE_EXTRA` in config.py) **mit großem Fenster**. Launcher/Clients/Server zählen nicht
  (League: erst das Match, nicht die Lobby). Ende erst nach 8 s ohne Spiel (Ladebildschirme).
- Sprachmodell: beim Spielstart sofort aus dem Grafikspeicher. Fragen im Spiel: lädt kurz (Antwort ~6 s statt ~1 s),
  bleibt 60 s, räumt dann selbst auf. Nach dem Spiel im Hintergrund vorgeladen.
  Gemessen: nur auf dem Prozessor 20–40 s pro Antwort (Qwen muss jedes Mal die ganze Anweisung neu lesen) → nicht brauchbar.
- Nebel: Zustand „Spielmodus“ (Augen halb zu, ruhig), Hinweis „Spielmodus · League of Legends“, Bildrate 24 statt 144.
  Liegt das Fenster auf dem Spiel-Bildschirm: nichts wird angezeigt, Nebel pausiert komplett. Testtaste G.
- Gemessen: Grafikspeicher mit League ohne Jarvis-Modell 3,3 GB, mit geladenem Modell 9,8 GB.

## Sprache (20.10.2026)
- **Weckwort** „Hey Jarvis“ (openWakeWord, Prozessor, 1,4 ms je 80 ms): 3/3 erkannt, 0/10 Fehlalarme. Eigenes Weckwort, sobald der Name feststeht.
- **Hören**: faster-whisper large-v3-turbo **deutsch** auf der Grafikkarte, 0,2 s pro Satz, 10/10 Testsätze richtig
  (allgemeines Modell: 5 Fehler; Prozessor: 5 s pro Satz → zu langsam). Ende des Sprechens per Pausenerkennung.
- **Stimme**: Qwen3-TTS 0.6B über **faster-qwen3-tts** (CUDA Graphs): erster Ton nach ~0,5 s, schneller als Echtzeit.
  (Original-Qwen3-TTS unter Windows: Faktor 2,2 → unbrauchbar.) Gewählt: **Nr. 21 „Dunkles Wesen“** + Live-Effekt **Schimmer**,
  halbe Lautstärke (`STIMME_LAUTSTAERKE`). Stimmen gestalten/auswählen: `python -m assistent.stimme_gestalten …`
  Hörproben in `stimmen/kandidaten`. Piper (Prozessor) als Notlösung und im Spielmodus.
- **Denken mit Sprache**: Qwen 3.5 **4B** (40/41 im Selbsttest), 14 von 33 Schichten auf der Grafikkarte → 3–4 s Denkzeit.
- **Grafikspeicher** (gemessen): alles zusammen höchstens **7,8 GB** inkl. Desktop und Twitch-Stream.
  Gefunden und behoben: Ollama verschätzt sich beim freien Speicher → Speicher lief über, Windows lagerte aus, Stream ruckelte;
  Stimme reservierte 2048er-Puffer (+1 GB beim Sprechen) → 640; Stimme muss im selben Thread erzeugen, in dem sie
  vorbereitet wurde; PyTorch muss vor allen anderen DLLs laden (WinError 1114) → in `assistent/__init__.py`.
- **Nebel**: Sprach-Nebel unten rechts wirbelt mit deiner Stimme und zeigt, was verstanden wurde; Jarvis' Augen pulsieren mit seiner echten Stimme.
- Module: `ohr.py`, `stimme.py`, `stimme_effekte.py`, `sprachschleife.py`, `stimme_gestalten.py`; Start wie gewohnt über `JARVIS-starten.bat`
  (Sprache lädt im Hintergrund, Tippen geht sofort; `--ohne-sprache` für nur Text).
- **Später:** Figur beim Sprechen so gestalten, dass sie zur Stimme passt (Wunsch 20.10.).

## Alles steuern, immer Feedback (20./21.10.2026, aus den Live-Gesprächen abgeleitet)
- **Gesprächsmodus**: nach „Hey Jarvis“ zwei Minuten weiter zuhören; Abschiede („Danke, das war's“, „Tschüss“, „Ruhe“) beenden.
  Vorprüfung „an mich gerichtet?“ (klare Befehle und direkte Ansprache gehen durch; Sätze an „Claude“, „Bruder“, „Mama“ nicht).
- **Unterbrechen**: während Jarvis spricht, hört ein Wächter mit – „Hey Jarvis“ stoppt sofort, lautes Dazwischenreden auch
  (Echo-Verhältnis wird gelernt; `UNTERBRECHEN_STIMME = False` bei Fehlalarmen). „Mach weiter“ setzt ab dem Satz fort.
- **Feedback im Fenster**: jede Aktion als Karte mit Icon/Markenlogo (Fehler rot); mehrere Aufträge als Liste mit ✓/✗;
  höchstens 5 Aktionen pro Antwort (`MAX_AKTIONEN`).
- **Anzeigen per Sprache** (`anzeige`): zeigen (bleibt dann stehen), ausblenden, verschieben in 9 Zonen, größer/kleiner,
  „mach dich kleiner“ (Anzeigen wachsen mit), zurücksetzen. Anzeigen **weichen einander aus**; der Platz für Jarvis' Text
  unten mittig bleibt immer frei. Player bleibt sichtbar, solange Musik läuft.
- **Gesprächstext**: dein Satz in der Sprach-Wolke unten rechts, Jarvis' Antwort unten mittig Wort für Wort im Takt der Stimme.
- **Fenster** (`fenster`, `programm_schliessen`, `wo` bei programm_starten/webseite_oeffnen): nach vorne holen, auf Monitor
  oben/links/mitte, Hälften, Drittel, mehrere nebeneinander, je Programm eigene Seite („Spotify rechts, links Twitch“);
  offene Fenster/Tabs haben Vorrang vor neuen. Schließen sanft (Spotify/Discord werden ganz beendet). Getestet mit dem Rechner.
- **Rechner** mit Rechenweg neben der Figur (exakt in Python, Prozent, Wurzel, „das mal drei“), **Nachrichten** (Tagesschau,
  Karten um das Gesicht, „mehr zur zweiten“, „noch mehr News“), **Wissen** (Wikipedia-Karte statt Raten), Wetter „nur jetzt“.
- **Spotify gezielt** (Play/Pause/Weiter direkt an Spotify, auch wenn Twitch die Medientasten hat), „Lieblingssongs“, bei 100 %
  im Mixer hebt „lauter“ die Gesamtlautstärke.
- **Ehrlichkeit/Stil**: Absicherungen gegen ungefragte Aktionen (Lautstärke, Anzeigen, Programmstart, Browser-Suche, Platz),
  „Übersprungen … behaupte nicht, es getan zu haben“, Floskel-Filter am Antwortende, Zahlen deutsch ausgeschrieben,
  Uhrzeit knapp, Monitore bekannt, Entwicklungsmodus (Claude liest mit), feste Persönlichkeit in **PERSOENLICHKEIT.md**.
- **Stimme** gleichmäßiger: Temperatur 0,65, fester Startwert; Aufnahmen bis 120 s.

## Großer Ausbau in der Nacht zum 21.10.2026 (Selbsttest 59/68 → siehe unten)
- **Festes Raster im Nebel** (`anzeigen.js`, `rasterPlatz`): Spalten links (L1–L3) und rechts (R1–R3) neben dem Gesicht, oben
  mittig (M1); jede Anzeige hat Wunschplätze, nimmt einen Platz nur, wenn sie ganz hineinpasst (rechts über der Sprach-Wolke).
  Selbst verschobene Anzeigen behalten ihren Platz und werden gespeichert, automatisches Ausweichen nicht mehr
  (Speicherschlüssel `-2`, die alte Liste voller Zufallsplätze wird ignoriert). Sprach-Wolke und Antwort skalieren mit
  `--sb` (Bildschirm) statt `--s` (wächst mit, wenn die Figur kleiner wird). `.platz.frei` hat `width: max-content`.
- **Neue Werkzeuge** (jetzt 28): `notizen`, `kalender` (Termine, Erinnerungen, Timer; `planer.py` mit Zeiterkennung und
  Wächter, Ansagen über die Sprachschleife), `datei` (`dateien.py`: Explorer-Auswahl, Fenster vorne, PDF/Word/Text, lange
  Dokumente abschnittsweise), `pc` (`pc.py`: Auslastung, sperren, Screenshot, Desktop, minimieren/maximieren, Ordner,
  Zwischenablage), `projekte` (`PROJEKTE.md`), `lautstaerke(aktion='abfragen')` = Mixer (`mixer.py`, mit Spotifys eigenem Regler).
- **Neue Anzeigen**: Kalender (Monatsraster + Einträge), Notizen, Timer (Ring + Restzeit), System (Balken), Mixer
  (Balken = Windows, Strich = Spotify), Dokument (`planer.js`, `system.js`). Werkzeuge legen Karten in `werkzeuge.nebel`,
  `gehirn.anzeigen_nach` schickt sie; „Zeig mir den Kalender“ holt den Inhalt über `werkzeuge.anzeige_inhalt`.
- **Nachrichten aus 12 Quellen** (RSS + Tagesschau): allgemein gemischt und ohne Doppelte, Themen Technik/Gaming/Sport/Köln,
  einzelne Quellen; die Quelle steht auf jeder Karte.
- **Wissen**: sucht zuerst den Gegenstand der Frage („Hauptstadt von Australien“ → Artikel Australien) und darin die passenden
  Sätze; Zwischenspeicher und Wiederholung bei Wikipedia-Fehler 429.
- **Kritik und Wünsche**: werden nicht mehr nur blockiert, sondern automatisch als Wunsch notiert („Ist notiert.“);
  „Ich hätte gern, dass du später …“ (`nur_wunsch`) führt nichts aus.
- **Kleinkram aus dem Selbsttest**: „Mach Spotify auf“ und „Starte Steam“ werden umgeleitet, „plus 15 Prozent“ rechnet
  mal 1,15, Platzangaben aus dem Satz schlagen falsche Modellangaben, „schließe Jarvis“ macht ihn nicht mehr kleiner,
  „im Nebel“ fliegt aus den Antworten.
- **Spielebibliothek** (`steam.py`, `spiele.js`, Werkzeug `spiele`): installierte Spiele mit Cover, zuletzt gespielt aus
  `localconfig.vdf`, „Starte Nummer 3“; neuere Spiele bekommen das Kopfbild aus der Shop-Schnittstelle (`daten/steam-cover.json`).
- **Würfeln, Münze, Zufallszahl und Umrechnen** im Werkzeug `rechnen` (`umrechnen.py`): Einheiten (Länge, Masse, Volumen,
  Tempo, Daten, Temperatur) und Währungen zum EZB-Referenzkurs, jeweils als Rechner-Karte mit Kurs bzw. Faktor.
- **„Was kannst du?“** zeigt ein Raster mit zwölf Fähigkeiten und Beispielsätzen (`faehigkeiten.js`), gesprochen nur ein Satz.
- **Musik leiser beim Zuhören** (`mixer.ducken`, `config.LEISER_BEIM_ZUHOEREN`): nach „Hey Jarvis“ gehen Spotify/Browser/VLC
  weich auf 30 %, nach dem Gespräch weich zurück; ein Lautstärkebefehl hebt die Absenkung vorher auf.
- **Vorschau zum Testen**: `.claude/launch.json` (Server auf Port 8790), `spielwiese/_szenario.js` + `_test.json` spielen
  alle Anzeigen ein und melden Überschneidungen (`window.szenario([...])`, `window.lage()`).

## Bekannte Schwächen
- Qwen behauptet manchmal Dinge, die das Werkzeug nicht bestätigt (z. B. „Blinding Lights gestartet“, obwohl nur die
  Suche geöffnet wurde). Wird mit verbundenem Spotify seltener, weil dann echte Ergebnisse zurückkommen.
- Qwen gibt Werkzeug-Ergebnisse manchmal leicht verdreht wieder (z. B. „läuft keine Musik“ statt „weiß ich nicht“).
  Gegenmittel: Werkzeuge liefern möglichst echte Daten statt „weiß nicht“.
- Witze/Kreatives sind mau (Grenze eines 9B-Modells). Für richtige Arbeit ist ja Claude vorgesehen.
- Bei „Was kannst du?“ manchmal zu lange Antworten (300+ Zeichen).
- **Grafikspeicher knapp**: Qwen 5,9 GB, insgesamt 8,1 von 10 GB belegt → ca. 2 GB frei für Sprache.

## Nächste Schritte
1. Selbst ausprobieren: `.venv\Scripts\python -m assistent.chat --probe`
2. **Sprache**: Spracherkennung (faster-whisper large-v3-turbo deutsch, evtl. auf der CPU wegen Grafikspeicher),
   Sprachausgabe (Qwen3-TTS 0,6B oder Chatterbox, Stimme wählen), Wake Word (openWakeWord, vorerst „Hey Jarvis“)
3. Verbindung Backend → Oberfläche (WebSocket: hört zu / denkt / spricht)
4. Claude-Übergabe (`claude -p` nach Vorlesen und Rückfrage)
5. Fenster/Hintergrund auf dem oberen Bildschirm, weitere visuelle Zustände
