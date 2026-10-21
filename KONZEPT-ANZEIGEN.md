# Konzept: Anzeigen 2.0 – alles per Sprache, alles intuitiv (20.10.2026)

Ziel: Alles, was Jarvis zeigt, ist ein **Baustein** im Nebel. Jeder Baustein lässt sich per **Sprache oder Maus**
platzieren, vergrößern, verkleinern, anheften und ausblenden. Jarvis versteht, worauf sich „die“, „sie“, „das da“,
„die zweite“ beziehen: immer auf das, was gerade zu sehen ist oder zuletzt gezeigt wurde.

## 1. Grundprinzipien
- **Sprache und Maus gleichwertig:** Alles, was man sagen kann, kann man auch klicken, und umgekehrt.
- **Nichts springt:** Jede Bewegung, Größenänderung, Umsortierung ist animiert (gleitet).
- **Bezug auf das Sichtbare:** „Mach sie größer“, „nimm die dritte“, „weiter“, „zurück“, „schließen“ beziehen sich auf die zuletzt gezeigte Anzeige.
- **Nummern zum Auswählen:** Listen (Streams, Playlists, Spiele) tragen kleine Nummern, damit man „öffne Nummer 3“ sagen kann.
- **Ehrlich:** Kann Jarvis etwas nicht (z. B. Dienst nicht verbunden), sagt er das kurz und zeigt, wie es geht.
- **Spielmodus hat Vorrang:** Auf dem Spiel-Bildschirm erscheint nie etwas.

## 2. Das Anzeigen-System (Fundament)
- **Zonen:** oben links, oben, oben rechts, links, Mitte, rechts, unten links, unten, unten rechts.
  Mehrere Anzeigen in einer Zone stapeln sich ordentlich (gleiten auseinander, wenn eine dazukommt oder geht).
- **Größen:** winzig, klein, normal, groß, riesig (oder „doppelt so groß“, „etwas kleiner“).
- **Das Gesicht ist auch ein Baustein:** „Mach dich kleiner“ → Augen und Nebel schrumpfen und rücken zur Seite oder nach oben,
  alle Anzeigen bekommen automatisch mehr Platz und werden größer. „Mach dich wieder groß“ → umgekehrt.
- **Anheften:** „Lass die Uhr stehen“ → bleibt dauerhaft. „Weg damit“ / „Blende alles aus“ / „Zeig alles“.
- **Fokus:** „Zeig mehr Streams“ → Twitch-Übersicht wird groß (2–3 Reihen, mehr Karten), Gesicht wird klein, Rest weicht aus.
- **Layouts speichern:** „Speichere das als Spiele-Layout“ → „Lade das Spiele-Layout“. Vorschläge: Standard, Gaming, Streams, Minimal.
- **Gemeinsame Befehle für alle Bausteine:** zeigen, ausblenden, anheften, lösen, verschieben (Zone), Größe, nach vorne, Seite weiter/zurück.

### Beispiele
| Gesagt | Ergebnis |
|---|---|
| „Pack alles nach links“ | alle sichtbaren Anzeigen gleiten in die linke Spalte |
| „Wetter nach oben rechts und größer“ | Wetteranzeige gleitet dorthin und wächst |
| „Mach dich kleiner“ | Gesicht schrumpft nach oben, Anzeigen werden größer |
| „Zeig mehr Streams“ | Twitch-Übersicht groß, mehr Karten, nächste Seite mit „weiter“ |
| „Lass den Player da“ | Player bleibt angeheftet |
| „Blende alles aus“ | nur noch das Gesicht |
| „Wie vorhin“ | letztes Layout wiederherstellen |

## 3. Icons
- **Lucide** (ISC-Lizenz) lokal als Dateien für alle normalen Symbole (Uhr, Timer, Lautstärke, Wetter, Download …).
- **Markenlogos** über **Simple Icons** (CC0) lokal, in Markenfarbe: Twitch, YouTube, Spotify, Steam, Discord, Netflix,
  Kick, Epic Games, Riot Games, GOG, EA, Chrome. (Lucide enthält keine Markenlogos mehr.)

## 4. Bausteine (bestehend ✅ und neu)
### Zeit
- ✅ Uhr
- **Countdowns/Timer:** „Timer 10 Minuten“, „Pizza-Timer 12 Minuten“ (mit Namen), mehrere gleichzeitig, als Ringe im Nebel,
  „wie lange noch?“, „Timer pausieren/stoppen/+5 Minuten“. Ablauf: Alarm-Zustand (Augen werden unruhig) + Ton + Ansage.
- **Wecker:** „Weck mich um 7:30“. **Stoppuhr:** „Stoppuhr starten/stopp“.
- **Erinnerungen:** „Erinnere mich in 20 Minuten an die Wäsche“ / „um 18 Uhr ans Training“.
### Medien
- ✅ Musik-Player, ✅ Twitch/YouTube-Player
- **Spotify-Übersichten** (nach Freischaltung): „Zeig meine Playlists“, „zuletzt gehört“, „meine Lieblingssongs“,
  „was kommt als Nächstes“ (Warteschlange), Suche mit Trefferliste („Such Linkin Park“ → Lieder/Alben zum Auswählen).
- **Lautstärke pro Programm:** „Spotify leiser“, „Discord lauter“, „Spiel auf 40 %“ (Windows-Mixer).
### Twitch (nach Freischaltung)
- ✅ Wer ist live (gefolgte Kanäle), ✅ Kategorie („Wer zockt gerade Minecraft?“), ✅ Stream öffnen
- **Mehr anzeigen / Seiten:** „Zeig mehr“, „weiter“, „zurück“; Übersicht wächst
- **Streamer suchen:** „Ist Papaplatte live?“, „Was streamt Gronkh gerade?“
- **Live-Benachrichtigung:** „XY ist jetzt live“ erscheint kurz im Nebel (abschaltbar, im Spielmodus nur leise)
- **Top-Streams Deutschland**, Sortierung nach Zuschauern
### Steam
- ✅ Spiel starten
- **Bibliothek:** „Zeig meine Spiele“ → Raster mit Cover-Bildern, „zuletzt gespielt“, Spielzeit
- **Downloads/Updates:** „Was lädt Steam gerade?“ → Fortschritt, Geschwindigkeit, Restzeit; Meldung „Download fertig“
- **Spiel-Infos:** „Wie lange hab ich Valheim gespielt?“
### Wetter
- ✅ Heute/morgen/Wochentag mit Zeitraffer und Animation
- **Wochenübersicht:** „Wie wird das Wetter diese Woche?“ → 7 Tage nebeneinander
### PC / System
- **Systemanzeige:** „Wie geht’s dem PC?“ → CPU/Grafikkarte (Auslastung, Temperatur), Grafikspeicher, Arbeitsspeicher, Festplatten, Netzwerk
- **Fenster verschieben:** „Discord auf den linken Bildschirm“, „Chrome maximieren“
- **Programme schließen** (mit Rückfrage), Screenshot
### Fenster aufteilen (echte Programme, wie Windows-Andocken)
- **„Zeig mir oben Twitch, Spotify und Discord“** → Jarvis öffnet, was fehlt (Twitch als eigenes Browserfenster), und teilt den
  genannten Bildschirm auf. Bildschirme per Name: „oben“, „links“, „Mitte/Hauptbildschirm“, „hier“ (wo die Maus ist).
- **Aufteilungen je nach Anzahl:** 1 → ganz/maximiert, 2 → zwei Hälften, 3 → drei Spalten **oder** groß links + zwei rechts
  („Twitch groß, Spotify und Discord daneben“), 4 → Viertel, 5–6 → Raster. Wie bei Windows auch oben/unten-Teilung.
- **Einzeln:** „Nur Twitch links“ (linke Hälfte), „Discord rechts oben“, „Spotify in die Ecke“, „Chrome maximieren“, „Discord weg“ (minimieren).
- **Gewichtung:** „Twitch größer“ → Twitch-Fenster bekommt zwei Drittel, die anderen rücken zusammen.
- **Merken:** „Speicher das als Streaming-Ansicht“ → „Streaming-Ansicht“ stellt alle Fenster genauso wieder her.
- Twitch-Kanal direkt mitgeben: „Oben Trymacs und Discord“ → Trymacs-Stream links, Discord rechts.
- Im Spielmodus wird der Spiel-Bildschirm nie angefasst.

### Alltag
- **Notizen / Listen:** „Schreib auf: Milch kaufen“ → Einkaufsliste; „Was steht auf meiner Liste?“; „Streich Milch“
- **Rechnen/Umrechnen:** „Was sind 15 % von 80?“, „Wie viel sind 30 Dollar in Euro?“ → kurze Rechnung im Nebel
### Claude-Übergabe
- **Arbeits-Anzeige:** „Claude arbeitet an …“, Fortschritt, am Ende Zusammenfassung zum Lesen/Vorlesen

## 4b. Bilder überall
- Twitch: Vorschaubild des Streams + Profilbild (offizielle Schnittstelle), YouTube: Vorschaubild + Kanal (aus Windows/Browser),
  Spotify: Cover von Liedern, Alben, Playlists und Künstlerbilder (Spotify-Schnittstelle), Steam: Cover/Bibliotheksbilder der Spiele.
- Bilder werden zwischengespeichert, damit die Anzeigen sofort erscheinen.

## 4c. Szenen: das ganze Bild verwandelt sich
Manche Fragen bekommen keine kleine Anzeige, sondern eine **Szene**: Die Figur rückt zur Seite (kleiner, z. B. oben links),
der Hintergrund wird zur Bühne, danach kehrt alles weich zurück („Danke, zurück“ oder nach einer Weile von selbst).
- **„Zeig mir unser Sonnensystem“:** 3D-Sonnensystem im Nebel (Sonne, Planeten in echten Positionen von heute, langsam drehend),
  „Zoom auf den Saturn“, „Wie weit ist der Mars weg?“ → Planet rückt in den Vordergrund mit Infos.
- **„Wie sieht der Sternenhimmel heute aus?“:** Sternbilder für deinen Ort und die Uhrzeit, Mondphase.
- **„Wo ist die ISS gerade?“:** Erdkugel mit der Position der Raumstation (frei verfügbare Daten).
- **Erde/Globus:** „Zeig mir Japan“ → Globus dreht sich dorthin, mit Uhrzeit und Wetter dort.
- **Karten und Routen:** „Wie komme ich nach Köln?“ → dunkle Karte im Nebel mit Route, Fahrzeit, Entfernung
  (OpenStreetMap + freier Routenplaner); „Öffne die Route in Google Maps“ → im Browser.
- Weitere: Zeitraffer des Wetters als Szene, Weltraum-Fakten, „Zeig mir das Wetter auf der Welt“.

## 4d. Antworten als Ergebniskarten
- **Wissen:** „Wer war Nikola Tesla?“ → Karte mit Bild, Kurzfassung und Quelle (Wikipedia, frei), Jarvis liest die Kurzfassung vor.
- **Nachrichten:** „Was gibt’s Neues?“ / „News zu Gaming“ → Schlagzeilen-Karten (Tagesschau u. a. per RSS, frei),
  „Erzähl mir mehr zur zweiten“ → Zusammenfassung, „Öffne den Artikel“.
- **Websuche mit Ergebnis:** Ergebnisse als Liste mit Nummern statt nur Browser öffnen; schwierige Fragen gehen an Claude.
- **Sport:** „Wie hat Köln gespielt?“, Bundesliga-Tabelle (OpenLigaDB, frei), Esport-Termine (z. B. League of Legends).
- **Rechnen/Umrechnen/Übersetzen:** Ergebnis als kleine Karte.

## 4e. KI-Nutzung im Blick
- **Claude:** Verbrauch im aktuellen 5-Stunden-Fenster und in der Woche, wann es zurückgesetzt wird (aus den Daten von Claude Code auf diesem PC).
- **ChatGPT/Codex:** dasselbe (aus den Sitzungsdaten der Codex-App, die Limits für 5 Stunden und Woche mitschreibt).
- Anzeige als zwei Ringe/Balken je Dienst; Warnung, wenn ein Limit fast erreicht ist; „Wie viel Claude hab ich noch?“.
- (Genaue Datenquellen werden beim Bauen geprüft.)

## 4f. Noch weiter gedacht
- **Tagesbriefing:** „Guten Morgen“ → Wetter, Termine, wer live ist, Steam-Updates, Nachrichten – als Abfolge von Anzeigen, vorgelesen.
- **Bildschirm verstehen:** „Was ist das auf meinem Bildschirm?“ / „Erklär mir die Fehlermeldung“ (Qwen kann Bilder lesen).
- **Fokus-/Pomodoro-Modus:** 25/5-Minuten-Ringe, Benachrichtigungen gedämpft.
- **Stimmungen:** Jarvis' Augen/Farben reagieren auf Inhalte (Gewitter → unruhig, gute Nachricht → heller).
- **Kalender** (später, wenn du einen nutzt), **Pakete verfolgen**, **Erinnerungen an Twitch-Termine**.
- **Discord:** wer im Sprachkanal ist (nur mit eigener Freischaltung, später).
- **Fotos/Bilder zeigen:** „Zeig mir Bilder von Polarlichtern“ (Bildersuche, später).

## 5. Technik (kurz)
- **Layout-Engine** in der Oberfläche: jeder Baustein meldet sich mit Name, Aliasnamen, Standard-Zone und Größe an.
  Bewegungen per FLIP-Animation (alte Position → neue Position gleitend). Layout wird gespeichert und an Jarvis gemeldet.
- **Ein Werkzeug „anzeige“** für alle Layout-Befehle (welche, Aktion, Zone, Größe) statt vieler Einzelwerkzeuge,
  damit das kleine Sprachmodell zuverlässig bleibt. Ähnlich gebündelt: „timer“, „steam“, „spotify“, „twitch“.
- **Kontext:** Jarvis kennt die gerade sichtbaren Anzeigen und die zuletzt gezeigte Liste („die zweite“, „weiter“).

- **Szenen** sind eigene 3D-Ebenen (Three.js) hinter dem Gesicht; die Figur ist dabei ein verschiebbarer Baustein.
- **Bilder** werden lokal zwischengespeichert (daten/bilder), damit nichts nachlädt, wenn die Anzeige erscheint.

## 6. Reihenfolge (Vorschlag)
1. **Fundament:** Icons lokal ✅ (Lucide + Markenlogos), Anzeigen-System mit Zonen/Größen/Anheften/Gesicht-Größe, Sprachbefehle dafür
2. **Countdowns, Wecker, Stoppuhr, Erinnerungen**
3. **Steam:** Bibliothek mit Covern, Downloads/Updates
4. **KI-Nutzung** (Claude/ChatGPT), **Nachrichten**, **Wissenskarten**
5. **Szenen:** Sonnensystem zuerst, dann Karten/Routen, Sternenhimmel, Globus
6. **Twitch erweitert** und **Spotify-Übersichten** – sobald freigeschaltet
7. **Fenster aufteilen** (Programme auf Bildschirme verteilen, Ansichten speichern)
8. **Systemanzeige, Lautstärke pro Programm, Notizen, Rechnen, Wetter-Woche, Sport, Tagesbriefing**
9. Parallel: **Sprache** fertigstellen (Stimme auswählen, Weckwort, Sprechschleife), Name festlegen
