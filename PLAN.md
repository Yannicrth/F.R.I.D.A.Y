# Projekt JARVIS – Planung

> **JARVIS ist nur der Projektname.** Name, Wake Word und Stimme des Assistenten
> werden in einer Konfigurationsdatei festgelegt und können jederzeit geändert werden.

## Ziel

Ein Sprachassistent, der lokal auf dem PC läuft und
- **den PC steuert**: Programme starten, Spotify, Steam, Chrome, Webseiten öffnen
- **mit mir spricht**: hört zu (Wake Word) und antwortet mit Stimme
- **analysiert und vorschlägt**: Bildschirm, Seiten, Fragen beantworten
- **richtige Arbeit an Claude weiterreicht**: Ich diktiere, der Assistent gibt es
  in Claude ein und das läuft über mein normales Abo

## Hardware (geprüft am 19.10.2026)

| Komponente | Wert |
|---|---|
| GPU | NVIDIA RTX 3080, 10 GB VRAM |
| CPU | Intel i9-12900KF, 16 Kerne / 24 Threads |
| RAM | 32 GB DDR5 |
| Speicher | D: 95 GB frei |

Bereits installiert: Python 3.12, Git, Node.js, Claude Code 2.1.282, Steam, Chrome, Spotify (Store).
Fehlt noch: Ollama.

## Architektur

```
Ich spreche ──► Wake Word ("Hey <Name>")          [lokal]
                    │
              Whisper: Sprache → Text               [lokal, GPU]
                    │
              Lokales LLM (Ollama)                  [lokal, gratis]
              entscheidet:
                ├─ Einfache Aktion → direkt ausführen
                │    (Spotify, Steam, Chrome, Seiten, Lautstärke …)
                ├─ Frage / Analyse → selbst beantworten
                │    (bei Bedarf mit Bildschirm-Analyse per Vision-Modell)
                └─ Richtige Arbeit → an Claude übergeben   [mein Abo]
                    │
              Sprachausgabe (Piper / Kokoro)        [lokal, CPU]
                    │
              Visuelle Oberfläche                   [noch offen]
```

### Übergabe an Claude (über das Abo)

Ich sage z. B.: *"Sag Claude, er soll in Projekt X den Login-Bug fixen."*

1. Der Assistent formuliert daraus die Eingabe.
2. **Er liest mir die Eingabe vor und fragt nach**, ob er sie so abschicken soll.
   Die Spracherkennung kann sich verhören.
3. Er gibt die Eingabe an Claude Code weiter, im richtigen Projektordner.
4. Er fasst mir das Ergebnis mündlich zusammen.

Weg dorthin, bevorzugt:
- **A) Claude Code direkt ansteuern (CLI)**: zuverlässig und läuft über dasselbe Abo.
  Die Antwort kommt als Text zurück, der Assistent kann sie also vorlesen.
  Die Sitzungen tauchen weiterhin normal in Claude auf.
- **B) In das Claude-Fenster tippen (UI-Automation)**: möglich, aber anfällig.
  Es geht kaputt, wenn sich das Layout oder der Fokus ändert, und die Antwort
  ist schwer wieder auszulesen. Nur als Notlösung oder zum reinen „Fenster öffnen
  und Text einfügen“.

### Gedächtnis

Der Assistent soll sich merken, wer ich bin, was ich mag und an welchen Projekten ich arbeite.
Gespeichert wird das lokal in einer Datei bzw. Datenbank, damit ich nicht jeden Tag alles neu erklären muss.

## Visuelle Inspiration

### Reel 1: „Humanoid View“ (reznikov_engineering), Hauptfavorit
- Eine **humanoide Figur aus leuchtenden Partikeln**: blau/cyan mit orange glühendem Kern im Kopf,
  vollflächig auf dem Bildschirm
- Links und rechts **fließende Partikel-„Flügel“** bzw. Energieströme in Blau mit goldenen Funken
- **Lebendiger Hintergrund**: alles bewegt sich ständig leicht, die Figur „atmet“
- **Reagiert auf Handgesten** vor der Webcam (Motion Tracking)
- **Wechselbare Stile / Modi** für die Partikel, dazu Soundeffekte
- Technisch machbar mit WebGL (Three.js) für die Partikel, MediaPipe für Hand-Tracking über die
  Webcam, und Kopplung an Mikrofon und Sprachausgabe, damit die Figur beim Sprechen pulsiert.
  Die RTX 3080 schafft das.
- Den Code dazu gibt es nicht öffentlich. Wir bauen das selbst nach.

### Reel 2: „Jarvis mit Claude an einem Wochenende“ (alan.buildz)
- Visuell: ein **cyanfarbener Arc-Reactor-Orb** (Ringe mit leuchtendem Kern) auf dunklem UI
  mit Info-Kacheln
- Inhaltlich: Werbung für einen Guide (Agent-Framework „Hermes Agent“ + Claude).
  Übernehmenswert ist die Idee mit dem **dauerhaften Gedächtnis**, siehe oben.

### Neue Richtung (19.10.2026): „Augen im dunklen Weltraum“
- Kein Kopf und keine Figur, sondern ein **dunkler, digitaler Nebel**. Das Gesicht ist nur eine
  **dunkle Lücke**, aus der **kantige, leuchtende Augen** schauen (Inspiration: Celestials, Watcher aus „What If“).
- Zustände: **Ruhe** = lauert kaum sichtbar im Nebel · **Hört zu** = tritt hervor, Augen öffnen sich ·
  **Denkt** = Nebel wirbelt, HUD-Bögen drehen sich · **Spricht** = Augen und Lichtwellen im Takt der Stimme
- Optionen: Farbwelten (Violett, Celestial, Blutrot, Abyss, Gold), Augenformen (Klingen, Schlitze,
  Celestial mit sechs Augen), Stirn-Juwel, HUD-Bögen, gepunktete Gesichtslinien
- Die früheren Figuren (Wächter, Drohne, Helm, Phönix, KI-Kern, abstrakte Formen) sind verworfen.
- **Grundform FERTIG (19.10.2026)**, gesichert als `spielwiese/grundform-v6.html` (Augenform aus dem Augen-Editor; v1–v5 als Vorstufen):
  - fast schwarzer Raum mit verstreuten Leuchtpunkten und leicht ziehendem Weltraumnebel außen,
    die Mitte zwischen den Augen bleibt dunkel
  - zarte Nebelströme mit feinen Blitzfasern laufen durch die äußeren Augenspitzen,
    ein feines Punktnetz verbindet sich ab und zu kurz; oben eine lockere Punktwolke
  - Augen: halb durchsichtige, spindelförmige blaue Linse mit Blitzadern, länglichem Hotspot,
    Violett/Rosa am Unterrand, Sternfunkeln, feinen Leuchtfäden an beiden Spitzen
  - langsames, schweres Blinzeln (ca. 1,5 s, alle 9–16 s), träge Augenbewegung, Tempo je Zustand
  - perspektivisch gekippter HUD-Ring aus Bogenstücken mit Leuchtpunkten, dreht langsam

### Spätere Zustände (nach der Grundform)
- **Wilder / aktiv**: deutlich mehr Nebel, der das Gesicht dichter umschließt, leuchtende Knoten
- **Denken**: HUD-Strukturen wie Kreise, Skalen, Mittellinie, dazu animierte Zeichenreihen,
  Ketten und Datenfluss durch den Nebel
- **Ärger / viel los**: aufgewühlter, heller Nebel mit Rosa-Akzenten, schnellere Bewegung
- **Stimmungen**: Augenform, Nebelform, Wirbel und Farbton verändern sich je nach Inhalt
  (z. B. freundlich, ernst, neugierig). Der Assistent wählt die Stimmung später selbst.

### Anzeigen im Nebel (Wunsch vom 20.10.2026)
Je nach Frage erscheint im Nebel eine passende Anzeige, die sich wieder auflöst:
- **Musik**: Lautstärkeregler im Nebel, mit der Maus (später per Geste) steuerbar.
  Dazu ein Player: Titel, Künstler, Cover (zerfällt in Partikel), Play/Pause/Weiter, Fortschritt,
  Nebel pulsiert im Takt der Musik.
- **Wetter**: Wetteranimationen passend zum echten Wetter (Regen, Schnee, Sonne, Gewitter, Nebel, Wind).
  Bei „Wie wird das Wetter morgen?“ läuft der Tag im Zeitraffer durch (Himmel, Temperatur, Regen pro Stunde).
- **Uhrzeit**: Uhr erscheint im HUD-Ring.
- Technisch für alle gleich: Werkzeug liefert Daten → Backend schickt ein Anzeige-Ereignis
  per WebSocket → Oberfläche zeigt die passende Anzeige im Nebel.
- ✅ **Gebaut am 20.10.2026**: Verbindung, Lautstärkeregler, Player, Uhr, Untertitel, automatische Zustände (Details in `STAND.md`).
  ✅ Wetter mit Zeitraffer und Animationen gebaut (20.10.2026).
  Offen: Musik-Takt im Nebel, Uhr direkt im HUD-Ring, Wochenübersicht beim Wetter.

### Entschieden: zwei Ansichten
- **Kompakt-Modus**: kleiner Orb in einer Bildschirmecke, wenn ich normal arbeite.
  Ausblendbar per Sprachbefehl („Versteck dich“) und automatisch bei Vollbild-Spielen.
- **Vollansicht**: die Partikel-Figur aus Reel 1, sobald ich mit dem Assistenten rede.
  Pulsiert beim Sprechen, später mit Handgesten. Danach schrumpft sie zurück zum Orb.

### Festgelegt
- **Overall Dark Mode.** Der Assistent sticht heraus und **leuchtet beim Sprechen** wie in Reel 1.
- Farben und Form der Figur sind noch offen. Wir probieren sie in einer **Spielwiese** aus
  (Prototyp mit umschaltbaren Farben, Formen und Zuständen).
- Die Vollansicht füllt den **ganzen Zuhause-Bildschirm**, und zwar **als Hintergrund**:
  Desktop-Symbole bleiben benutzbar.

### Technische Möglichkeiten (Three.js / WebGL)
- **GPU-Partikel mit eigenen Shadern**: hunderttausende Partikel flüssig, bei Bedarf über eine
  Million (GPGPU / WebGPU)
- **Bloom (Leuchten)**: das Glühen aus Reel 1. Lässt sich beim Sprechen hochdrehen.
- **Morphing**: dieselben Partikel fließen von einer Form in die andere (Orb → Gesicht → Figur).
  Ideal zum Ausprobieren und für den Übergang Orb ↔ Vollansicht.
- **Formen aus 3D-Modellen**: Partikel auf der Oberfläche eines 3D-Kopfes/-Körpers verteilen
- **Strömungsfelder (Curl Noise)**: die fließenden Energie-„Flügel“ und der lebendige Hintergrund
- **Audio-reaktiv**: Lautstärke und Frequenzen von Mikrofon und Sprachausgabe steuern Leuchten und Bewegung

### Als Hintergrund hinter den Desktop-Symbolen
- Auf Windows möglich: Die Figur läuft als „lebendiges Hintergrundbild“, so wie es
  Wallpaper Engine oder Lively Wallpaper machen. Desktop-Symbole liegen darüber und bleiben klickbar.
- Etwas kniffliger umzusetzen. Muss auf deiner Windows-Version getestet werden.
- Bei Bedarf kann er trotzdem kurz nach vorne kommen (z. B. für wichtige Meldungen).

### Idee: Desktop aufräumen
- Der Assistent beobachtet den Desktop-Ordner. Legst du dort etwas ab, reagiert die Figur sichtbar
  und schlägt vor, wohin es gehört: *„Das ist ein Screenshot. Soll ich ihn in Bilder/Screenshots
  verschieben?“*
- Erst mit Rückfrage. Später lernt er Regeln, z. B. „Screenshots immer nach X“.
- Symbole automatisch anzuordnen ist auch möglich, aber kniffliger. Das kommt später.

## Bildschirme

Aktuelles Setup (ausgelesen am 19.10.2026):

| Windows-Name | Auflösung | Position | Monitor |
|---|---|---|---|
| DISPLAY2 | 2560×1440 | Mitte, **Hauptbildschirm** | vermutlich Samsung Odyssey G5 |
| DISPLAY1 | 1920×1080 | oberhalb | Samsung C27F398 |
| DISPLAY3 | 1920×1080 | links | Samsung C27F398 |

### Rollen pro Bildschirm
- **Zuhause**: hier „wohnt“ der Assistent, hier erscheinen Orb und Vollansicht.
- **Arbeit**: hier öffnet er Programme, Chrome, Ergebnisse usw.
- **Tabu**: hier taucht er nie auf (z. B. der Gaming-Bildschirm).
- Ein Bildschirm kann mehrere Rollen haben. Bei Bedarf darf er sich kurz über **alle** ausbreiten.

### Per Sprache steuerbar
- „Geh auf den oberen Bildschirm“ / „Mach dich klein“ / „Zeig dich überall“
- „Öffne Chrome auf dem linken Bildschirm“
- „Welcher ist welcher?“ → er blendet auf jedem Bildschirm groß eine Nummer ein

### Wechselndes Setup
- Der Assistent erkennt automatisch, wenn Bildschirme dazukommen oder wegfallen.
- Für jede Kombination merkt er sich ein eigenes **Profil**, z. B. „alle drei“ oder „nur Hauptbildschirm“.
- Bei einem neuen, unbekannten Setup fragt er nach: *„Ich sehe nur noch zwei Bildschirme.
  Wo soll ich hin?“* Die Antwort speichert er als neues Profil.
- Fällt sein Zuhause-Bildschirm weg, zieht er automatisch als Orb auf den Hauptbildschirm um.

### Startprofil „alle drei“ (aktuelles Setup)
- **Zuhause**: oben (DISPLAY1)
- **Arbeit**: Mitte (DISPLAY2) und links (DISPLAY3)
- Nur der Startwert, jederzeit per Sprache oder in den Einstellungen änderbar.

### Spielmodus
- **Erkennung**: Der Assistent merkt, wenn ein Spiel läuft (Steam meldet das laufende Spiel,
  zusätzlich wird auf Vollbild-Fenster geachtet) und auf **welchem Bildschirm**.
- Dieser Bildschirm wird für die Dauer des Spiels automatisch **Tabu**:
  - keine Einblendungen, kein Orb, keine Fenster darüber
  - **niemals den Fokus stehlen**, also nichts, was das Spiel minimiert oder in den Hintergrund schiebt
  - Antworten, Infos und geöffnete Programme landen auf den **anderen** Bildschirmen
- **Leistung schonen**: Spiel und lokales LLM teilen sich die 10 GB VRAM der RTX 3080.
  Optionen während des Spiels (Entscheidung beim Bauen, nach Tests):
  - Animationen auf ein Minimum drosseln
  - LLM aus dem Grafikspeicher entladen und nur das Wake Word aktiv lassen,
    bei Bedarf kurz nachladen (dauert ein paar Sekunden)
  - oder ein kleineres Modell bzw. die CPU nutzen
- Nach dem Spiel wird alles automatisch wieder normal.
- Wenn ich im Spiel mit ihm rede, antwortet er nur per Stimme. Ausnahme ist, wenn ich ausdrücklich
  etwas auf einem anderen Bildschirm sehen will.

## Technik-Auswahl (recherchiert am 19.10.2026)

Für jeden Baustein testen wir die zwei stärksten Kandidaten mit eigenen deutschen Testaufgaben
und nehmen den Sieger. Allgemeine Ranglisten sagen wenig über Deutsch und Tool-Calling aus.

| Baustein | Favorit | Herausforderer | Hinweise |
|---|---|---|---|
| LLM-Laufzeit | **Ollama** (MIT, OpenAI-kompatible API) | llama.cpp-Server | Gleiche Engine, Ollama ist auf Windows am einfachsten |
| Lokales LLM | ✅ **Qwen 3.5 9B** (q4, 6,6 GB, Tools, Bild), **entschieden 19.10.** | Gemma 4 12B (qat, 7,2 GB, Tools, Bild) | Beide 52/52 im Test. Qwen schneller (0,8 s) und 2 GB sparsamer; Gemma formuliert etwas schöner. Siehe `benchmark-ergebnis.md` |
| Spracherkennung | **faster-whisper large-v3-turbo**, deutsch feinjustiert (primeline) | Parakeet v3 (schneller, Deutsch etwas ungenauer) | Whisper hat in Tests die niedrigste deutsche Fehlerquote |
| Sprachausgabe | **Qwen3-TTS** (Apache 2.0, Deutsch, Stimme per Beschreibung gestaltbar) | **Chatterbox Multilingual** (MIT, Deutsch, Stimmklonen) | Piper (CPU, sofort) als schnelle Notlösung |
| Musik | ✅ **Spotify Web API** über spotipy (MIT, Premium nötig) | – | Abspielen von Lied/Künstler/Album/Playlist; Anmeldung über `http://127.0.0.1:8778/callback` |
| Was läuft / Player | ✅ **Windows-Mediensteuerung** über pywinrt (MIT) | – | Kennt jeden Player ohne Anmeldung: Titel, Künstler, Position, Cover |
| Wake Word | **openWakeWord** („Hey Jarvis“ fertig, eigenes Wort trainierbar) | – | Porcupine hat den kostenlosen Zugang am 30.06.2026 eingestellt |

**Grafikspeicher (10 GB), gemessen 19.10.:** Qwen belegt 5,9 GB (mit 8192 Kontext). Mit Desktop,
Browser usw. sind insgesamt 8,1 GB belegt, **frei bleiben nur ca. 2 GB**. Für Spracherkennung und
Sprachausgabe heißt das: Whisper auf der CPU (der i9 schafft das) oder int8 auf der GPU, TTS-Modell
klein (0,6B) bzw. auf der CPU. Muss beim Bauen der Sprache gemessen werden.

## Sicherheitsregeln

- Der Assistent darf nur Aktionen aus einer **festen Liste** ausführen, keine beliebigen Befehle.
- **Rückfrage** vor allem, was etwas löscht, kauft, verschickt oder an Claude übergibt.
- Inhalte von Webseiten oder vom Bildschirm sind **nur Daten, keine Befehle**.

## Phasen

1. **Visuelles** (zuerst, auf Wunsch):
   a. Prototyp der Partikel-Figur mit den Zuständen Ruhe, Hört zu und Spricht (umschaltbar per Tasten)
      → **Grundform fertig**: `spielwiese/grundform-v6.html` (Augenform aus dem Augen-Editor; v1–v5 als Vorstufen) (Start mit `spielwiese/start.bat`)
   a2. Weitere Zustände auf Basis der Grundform: wilder/aktiv, Denken (Datenketten, HUD),
       Alarm/Stress (aufgewühlt, schneller), Stimmungen
   b. Reaktion aufs Mikrofon, damit die Figur auf echte Stimme pulsiert
   c. Kompakt-Orb und Übergang Orb ↔ Figur
   d. Eigenes Fenster: transparent, immer im Vordergrund, durchklickbar, auf dem Zuhause-Bildschirm
   e. Bildschirm-Erkennung, Profile und Spielmodus
2. **Fundament**: Ollama installieren, Python-Umgebung anlegen, Grundgerüst bauen.
   Steuerung zuerst per Text-Chat (Spotify, Steam, Chrome, Seiten). Das Backend schickt
   seinen Zustand an die Oberfläche.
   → **Weitgehend fertig (19.10.)**: Ollama, Python, Modell entschieden, Text-Chat mit Werkzeugen läuft.
     Details und Testergebnisse in `STAND.md`. Offen: Verbindung Backend → Oberfläche.
3. **Sprache**: Wake Word, Whisper und Sprachausgabe auf Deutsch.
4. **Claude-Übergabe**: diktieren, vorlesen, bestätigen, an Claude Code übergeben, Ergebnis zusammenfassen.
5. **Erweiterungen**: Bildschirm-Analyse, Websuche, Vorschläge, Handgesten, eigener Name mit eigenem Wake Word.

### Technik für die Oberfläche
- **Electron** (Node.js ist installiert) mit **Three.js** für die Partikel.
  Electron kann transparente, durchklickbare Fenster immer im Vordergrund, kennt alle Bildschirme
  und meldet, wenn einer dazukommt oder wegfällt.
- Die Oberfläche ist nur das „Gesicht“. Später bekommt sie vom Python-Backend über eine lokale
  Verbindung (WebSocket) gesagt, was sie zeigen soll (hört zu, denkt, spricht, Lautstärke …).
  Bis dahin wird sie per Taste gesteuert, damit wir das Aussehen unabhängig testen können.

## Offene Punkte

- [x] **Visuelles**: Orb (kompakt) + Partikel-Figur (Vollansicht)
- [x] **Bildschirm-Rollen**: Zuhause oben, Arbeit Mitte und links, Spiel-Bildschirm automatisch Tabu
- [ ] Weitere visuelle Ideen? Farben?
- [ ] **Name und Stimme** des Assistenten
- [ ] Welche Projektordner soll der Assistent an Claude übergeben dürfen?
- [ ] Welche Webseiten und Programme sollen per Kurzbefehl erreichbar sein?
