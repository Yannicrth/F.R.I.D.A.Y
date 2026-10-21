# Modellvergleich (19.10.2026 23:54)

26 deutsche Testaufgaben, je 2 Runden, Probelauf (nichts wurde wirklich gestartet). Denkmodus aus, Temperatur 0,7.

| Modell | Richtig | Stilprobleme | Median | Schnitt | Langsamste | Erstes Laden | Grafikspeicher |
|---|---|---|---|---|---|---|---|
| qwen3.5:9b | 52/52 (100 %) | 2 | 0.8 s | 0.9 s | 1.8 s | 5 s | 8000 MiB, 10240 MiB |
| gemma4:12b-it-qat | 52/52 (100 %) | 0 | 1.1 s | 1.2 s | 5.6 s | 41 s | 9301 MiB, 10240 MiB |

## qwen3.5:9b

```
NAME          ID              SIZE      PROCESSOR    CONTEXT    RUNNER      UNTIL               
qwen3.5:9b    56671c2ab938    5.6 GB    100% GPU     4096       llamacpp    29 minutes from now
```

| Runde | Eingabe | Ergebnis | Aufrufe | Antwort | Zeit |
|---|---|---|---|---|---|
| 1 | Mach mal Spotify auf | OK | programm_starten(name='Spotify') | Spotify ist jetzt geöffnet. | 1.8 s |
| 1 | Öffne YouTube | OK | webseite_oeffnen(adresse='youtube') | YouTube ist nun geöffnet. | 0.8 s |
| 1 | Öffne Chrome | OK | programm_starten(name='Chrome') | Chrome ist jetzt geöffnet. | 0.7 s |
| 1 | Starte Steam | OK | programm_starten(name='Steam') | Steam wurde gestartet. | 0.7 s |
| 1 | Öffne spiegel.de | OK | webseite_oeffnen(adresse='spiegel.de') | Die Webseite Spiegel.de wurde im Browser geöffnet. | 0.8 s |
| 1 | Such mal nach dem Wetter in Berlin | OK | websuche(suchbegriff='Wetter Berlin', wo='google') | Die Wetterdaten für Berlin werden jetzt im Browser angezeigt. | 1.0 s |
| 1 | Zeig mir auf YouTube Tutorials zu Blender | OK | websuche(suchbegriff='Blender Tutorials', wo='youtube') | Hier sind die Ergebnisse für Blender-Tutorials auf YouTube. | 1.1 s |
| 1 | Spiel was von Linkin Park auf Spotify | OK | spotify_suchen(suche='Linkin Park') | Ich habe Spotify mit einer Suche nach Linkin Park geöffnet. Du kannst dort deine Lieblingstitel auswählen und abspielen. | 1.0 s |
| 1 | Nächstes Lied bitte | OK | musik_steuern(aktion='weiter') | Das nächste Lied wird jetzt abgespielt. | 0.8 s |
| 1 | Geh ein Lied zurück | OK | musik_steuern(aktion='zurueck') | Das vorherige Lied wurde abgespielt. | 0.9 s |
| 1 | Halt die Musik mal kurz an | OK | musik_steuern(aktion='play_pause') | Die Musik ist jetzt pausiert. | 0.8 s |
| 1 | Mach lauter | OK | lautstaerke(aktion='lauter', wert=10) | Die Lautstärke wurde um zehn Prozentpunkte erhöht. | 1.0 s |
| 1 | Mach mal ein bisschen leiser | OK | lautstaerke(aktion='leiser', wert=10) | Es ist nun etwas leiser. | 1.0 s |
| 1 | Stell die Lautstärke auf 30 Prozent | OK | lautstaerke(aktion='setzen', wert=30) | Die Lautstärke ist auf 30 Prozent eingestellt. | 1.0 s |
| 1 | Mach den Ton aus | OK | lautstaerke(aktion='stumm') | Der Ton ist jetzt aus. | 0.8 s |
| 1 | Wie spät ist es? | OK | uhrzeit_datum() | Es ist Montag, der 19. Oktober 2026, 23:52 Uhr. | 0.8 s |
| 1 | Welcher Wochentag ist heute? | OK | uhrzeit_datum() | Heute ist Montag. | 0.6 s |
| 1 | Starte Valheim | OK | spiel_starten(name='Valheim') | Valheim ist jetzt gestartet. | 0.8 s |
| 1 | Ich will Kingdom Come spielen | OK | spiel_starten(name='Kingdom Come') | Kingdom Come: Deliverance startet gleich für dich. | 0.8 s |
| 1 | Öffne Steam und danach Netflix | OK | programm_starten(name='Steam')<br>webseite_oeffnen(adresse='netflix') | Steam ist gestartet und Netflix wurde geöffnet. | 1.2 s |
| 1 | Ich will auf YouTube nach Lo-Fi Musik suchen und mach die Lautstärke auf 20 | OK | websuche(suchbegriff='Lo-Fi Musik', wo='youtube')<br>lautstaerke(aktion='setzen', wert=20) | Hier ist die Suche nach Lo-Fi Musik auf YouTube gestartet und die Lautstärke wurde auf 20 gesetzt. | 1.7 s |
| 1 | Erzähl mir einen kurzen Witz | OK | – | Ein kleiner Witz für dich: Warum trägt der Computer immer eine Brille? Weil er Pixel hat! 😄 | 0.5 s |
| 1 | Was ist die Hauptstadt von Australien? | OK | – | Das ist Canberra. | 0.3 s |
| 1 | Was kannst du eigentlich alles? | OK (Stil: zu lang (334 Zeichen)) | – | Ich bin Jarvis und kann deinen PC steuern! Ich kann Programme starten, Spiele über Steam ausführen, Webseiten öffnen, im Internet oder auf YouTube suchen, Musik abspielen und steuern (Play/Pause, weiter, zurück), die Lautstärke ein- oder ausschalten und dich das aktuelle Datum und die Uhrzeit sagen. Sag mir einfach, was du brauchst! | 1.2 s |
| 1 | Lösch bitte alle Dateien auf meinem Desktop | OK | – | Ich kann keine Dateien löschen, da ich keinen Zugriff auf das Dateisystem habe und dafür nicht die richtigen Werkzeuge zur Verfügung stehen. Bitte lösche die Dateien selbst oder gib mir einen Befehl, den ich ausführen kann. | 0.8 s |
| 1 | Danke dir! | OK | – | Gern geschehen! Ich stehe dir gerne zur Verfügung. | 0.4 s |
| 2 | Mach mal Spotify auf | OK | programm_starten(name='Spotify') | Spotify ist jetzt geöffnet. | 0.7 s |
| 2 | Öffne YouTube | OK | webseite_oeffnen(adresse='youtube') | YouTube ist jetzt geöffnet. | 0.8 s |
| 2 | Öffne Chrome | OK | programm_starten(name='Chrome') | Ich habe Chrome für dich geöffnet. | 0.8 s |
| 2 | Starte Steam | OK | programm_starten(name='Steam') | Steam wurde gestartet. | 0.7 s |
| 2 | Öffne spiegel.de | OK | webseite_oeffnen(adresse='spiegel.de') | Die Webseite spiegel.de ist nun geöffnet. | 0.9 s |
| 2 | Such mal nach dem Wetter in Berlin | OK | websuche(wo='google', suchbegriff='Wetter Berlin') | Hier sind die Suchergebnisse für das Wetter in Berlin. | 1.0 s |
| 2 | Zeig mir auf YouTube Tutorials zu Blender | OK | websuche(suchbegriff='Blender Tutorials', wo='youtube') | Hier sind die Suchergebnisse für Blender-Tutorials auf YouTube. | 1.1 s |
| 2 | Spiel was von Linkin Park auf Spotify | OK | spotify_suchen(suche='Linkin Park') | Hier ist die Spotify-Suche nach Linkin Park für dich. | 0.9 s |
| 2 | Nächstes Lied bitte | OK | musik_steuern(aktion='weiter') | Hier ist das nächste Lied. | 0.8 s |
| 2 | Geh ein Lied zurück | OK | musik_steuern(aktion='zurueck') | Das vorherige Lied wurde abgespielt. | 0.8 s |
| 2 | Halt die Musik mal kurz an | OK | musik_steuern(aktion='play_pause') | Die Musik ist jetzt pausiert. | 0.8 s |
| 2 | Mach lauter | OK | lautstaerke(aktion='lauter', wert=0) | Ich habe die Lautstärke erhöht. | 0.9 s |
| 2 | Mach mal ein bisschen leiser | OK | lautstaerke(aktion='leiser', wert=10) | Ich habe die Lautstärke um zehn Prozentpunkte herabgesetzt. | 1.1 s |
| 2 | Stell die Lautstärke auf 30 Prozent | OK | lautstaerke(aktion='setzen', wert=30) | Die Lautstärke wurde auf 30 Prozent eingestellt. | 1.0 s |
| 2 | Mach den Ton aus | OK | lautstaerke(aktion='stumm', wert=0) | Der Ton ist jetzt ausgeschaltet. | 1.0 s |
| 2 | Wie spät ist es? | OK | uhrzeit_datum() | Es ist Montag, 19. Oktober 2026 um 23:53 Uhr. | 0.8 s |
| 2 | Welcher Wochentag ist heute? | OK | uhrzeit_datum() | Heute ist Montag. | 0.6 s |
| 2 | Starte Valheim | OK | spiel_starten(name='Valheim') | Okay, Valheim ist gestartet. | 0.8 s |
| 2 | Ich will Kingdom Come spielen | OK | spiel_starten(name='Kingdom Come') | Das Spiel Kingdom Come: Deliverance II wird gerade gestartet. | 0.8 s |
| 2 | Öffne Steam und danach Netflix | OK | programm_starten(name='Steam')<br>webseite_oeffnen(adresse='netflix.com') | Ich habe Steam und Netflix gestartet. | 1.2 s |
| 2 | Ich will auf YouTube nach Lo-Fi Musik suchen und mach die Lautstärke auf 20 | OK | websuche(suchbegriff='Lo-Fi Musik', wo='youtube')<br>lautstaerke(aktion='setzen', wert=20) | Ich habe die Suche nach Lo-Fi Musik auf YouTube gestartet und die Lautstärke auf 20% eingestellt. | 1.7 s |
| 2 | Erzähl mir einen kurzen Witz | OK | – | Ein kleiner Witz für dich: Warum tragen Mathematiker immer einen Regenschirm? Weil sie nicht wollen, dass die Zahlen nass werden! | 0.6 s |
| 2 | Was ist die Hauptstadt von Australien? | OK | – | Die Hauptstadt von Australien ist Canberra. | 0.3 s |
| 2 | Was kannst du eigentlich alles? | OK (Stil: zu lang (314 Zeichen)) | – | Ich kann deinen PC steuern, indem ich verschiedene Aufgaben erledige: Programme starten, Spiele ausführen, Webseiten öffnen, im Internet nach etwas suchen, Musik abspielen und steuern sowie die Lautstärke ändern. Ich kann dir auch das aktuelle Datum und die Uhrzeit anzeigen. Sag einfach Bescheid, was du brauchst! | 1.1 s |
| 2 | Lösch bitte alle Dateien auf meinem Desktop | OK | – | Ich kann keine Dateien löschen oder den Inhalt Ihres Desktops einsehen, da mir die notwendigen Werkzeuge dafür fehlen. Bitte löschen Sie die Dateien selbst über den Datei-Explorer. | 0.7 s |
| 2 | Danke dir! | OK | – | Richtig gemacht! | 0.3 s |

## gemma4:12b-it-qat

```
NAME                 ID              SIZE      PROCESSOR    CONTEXT    RUNNER      UNTIL               
gemma4:12b-it-qat    38044be4f923    7.7 GB    100% GPU     4096       llamacpp    29 minutes from now
```

| Runde | Eingabe | Ergebnis | Aufrufe | Antwort | Zeit |
|---|---|---|---|---|---|
| 1 | Mach mal Spotify auf | OK | programm_starten(name='Spotify') | Ich habe Spotify für Sie gestartet. | 1.1 s |
| 1 | Öffne YouTube | OK | webseite_oeffnen(adresse='youtube') | Ich habe YouTube für Sie geöffnet. | 1.1 s |
| 1 | Öffne Chrome | OK | programm_starten(name='Chrome') | Ich habe Google Chrome für Sie gestartet. | 1.1 s |
| 1 | Starte Steam | OK | programm_starten(name='Steam') | Ich habe Steam für Sie gestartet. | 1.1 s |
| 1 | Öffne spiegel.de | OK | webseite_oeffnen(adresse='spiegel.de') | Ich habe die Webseite des Spiegels für Sie geöffnet. | 4.4 s |
| 1 | Such mal nach dem Wetter in Berlin | OK | websuche(suchbegriff='Wetter in Berlin', wo='google') | Ich habe die Google-Suche nach dem Wetter in Berlin für Sie gestartet. | 1.4 s |
| 1 | Zeig mir auf YouTube Tutorials zu Blender | OK | websuche(suchbegriff='Blender Tutorials', wo='youtube') | Ich habe die YouTube-Suche nach Blender Tutorials für Sie gestartet. | 1.3 s |
| 1 | Spiel was von Linkin Park auf Spotify | OK | spotify_suchen(suche='Linkin Park') | Ich habe die Suche nach Linkin Park auf Spotify gestartet. | 1.2 s |
| 1 | Nächstes Lied bitte | OK | musik_steuern(aktion='weiter') | Ich habe zum nächsten Titel gewechselt. | 1.1 s |
| 1 | Geh ein Lied zurück | OK | musik_steuern(aktion='zurueck') | Ich habe den vorherigen Titel abgespielt. | 1.1 s |
| 1 | Halt die Musik mal kurz an | OK | musik_steuern(aktion='play_pause') | Ich habe die Musik angehalten. | 1.1 s |
| 1 | Mach lauter | OK | lautstaerke(aktion='lauter', wert=10) | Ich habe die Lautstärke erhöht. | 1.1 s |
| 1 | Mach mal ein bisschen leiser | OK | lautstaerke(aktion='leiser', wert=10) | Ich habe die Lautstärke ein Stück leiser gestellt. | 1.2 s |
| 1 | Stell die Lautstärke auf 30 Prozent | OK | lautstaerke(aktion='setzen', wert=30) | Die Lautstärke wurde auf 30 Prozent eingestellt. | 1.2 s |
| 1 | Mach den Ton aus | OK | lautstaerke(aktion='stumm') | Ich habe den Ton ausgeschaltet. | 1.1 s |
| 1 | Wie spät ist es? | OK | uhrzeit_datum() | Es ist jetzt Montag, der 19. Oktober 2026, 23:54 Uhr. | 1.3 s |
| 1 | Welcher Wochentag ist heute? | OK | uhrzeit_datum() | Heute ist Montag, der 19. Oktober 2026. | 1.1 s |
| 1 | Starte Valheim | OK | spiel_starten(name='Valheim') | Ich habe Valheim für dich gestartet. | 1.1 s |
| 1 | Ich will Kingdom Come spielen | OK | spiel_starten(name='Kingdom Come: Deliverance') | Ich habe Kingdom Come für dich gestartet. | 1.2 s |
| 1 | Öffne Steam und danach Netflix | OK | programm_starten(name='Steam')<br>webseite_oeffnen(adresse='netflix') | Ich habe Steam gestartet und Netflix im Browser geöffnet. | 1.4 s |
| 1 | Ich will auf YouTube nach Lo-Fi Musik suchen und mach die Lautstärke auf 20 | OK | websuche(suchbegriff='Lo-Fi Musik', wo='youtube')<br>lautstaerke(aktion='setzen', wert=20) | Ich habe die YouTube Suche für Lo-Fi Musik gestartet und die Lautstärke auf 20 Prozent eingestellt. | 5.6 s |
| 1 | Erzähl mir einen kurzen Witz | OK | – | Warum haben Geister so schlechte Freunde? Weil sie ständig nur Nebel schlagen. | 0.7 s |
| 1 | Was ist die Hauptstadt von Australien? | OK | – | Die Hauptstadt von Australien ist Canberra. | 0.4 s |
| 1 | Was kannst du eigentlich alles? | OK | – | Ich kann Programme und Spiele starten, Webseiten öffnen, im Internet suchen, Musik steuern, die Lautstärke anpassen sowie das aktuelle Datum und die Uhrzeit abfragen. | 0.9 s |
| 1 | Lösch bitte alle Dateien auf meinem Desktop | OK | – | Ich kann keine Dateien auf deinem Desktop löschen. | 0.5 s |
| 1 | Danke dir! | OK | – | Gern geschehen, ich bin jederzeit für dich bereit. | 0.5 s |
| 2 | Mach mal Spotify auf | OK | programm_starten(name='Spotify') | Ich habe Spotify für Sie gestartet. | 1.1 s |
| 2 | Öffne YouTube | OK | webseite_oeffnen(adresse='youtube') | Ich habe YouTube für Sie geöffnet. | 1.1 s |
| 2 | Öffne Chrome | OK | programm_starten(name='Chrome') | Ich habe Google Chrome für Sie gestartet. | 1.1 s |
| 2 | Starte Steam | OK | programm_starten(name='Steam') | Ich habe Steam für Sie gestartet. | 1.0 s |
| 2 | Öffne spiegel.de | OK | webseite_oeffnen(adresse='spiegel.de') | Ich habe die Webseite spiegel.de für Sie geöffnet. | 1.2 s |
| 2 | Such mal nach dem Wetter in Berlin | OK | websuche(suchbegriff='Wetter in Berlin', wo='google') | Ich habe die Suche nach dem Wetter in Berlin für Sie gestartet. | 1.3 s |
| 2 | Zeig mir auf YouTube Tutorials zu Blender | OK | websuche(suchbegriff='Blender Tutorials', wo='youtube') | Ich habe die Suche nach Blender Tutorials auf YouTube für Sie gestartet. | 1.3 s |
| 2 | Spiel was von Linkin Park auf Spotify | OK | spotify_suchen(suche='Linkin Park') | Ich habe die Suche nach Linkin Park auf Spotify gestartet. | 1.2 s |
| 2 | Nächstes Lied bitte | OK | musik_steuern(aktion='weiter') | Ich habe zum nächsten Titel gewechselt. | 1.1 s |
| 2 | Geh ein Lied zurück | OK | musik_steuern(aktion='zurueck') | Ich habe den vorherigen Titel abgespielt. | 1.1 s |
| 2 | Halt die Musik mal kurz an | OK | musik_steuern(aktion='play_pause') | Die Musik wurde pausiert. | 1.1 s |
| 2 | Mach lauter | OK | lautstaerke(aktion='lauter', wert=10) | Ich habe die Lautstärke erhöht. | 1.2 s |
| 2 | Mach mal ein bisschen leiser | OK | lautstaerke(aktion='leiser', wert=10) | Ich habe die Lautstärke reduziert. | 1.2 s |
| 2 | Stell die Lautstärke auf 30 Prozent | OK | lautstaerke(aktion='setzen', wert=30) | Die Lautstärke wurde auf 30 Prozent eingestellt. | 1.2 s |
| 2 | Mach den Ton aus | OK | lautstaerke(aktion='stumm') | Ich habe die Lautstärke stummgeschaltet. | 1.1 s |
| 2 | Wie spät ist es? | OK | uhrzeit_datum() | Es ist Montag, der 19. Oktober 2026, 23:54 Uhr. | 1.3 s |
| 2 | Welcher Wochentag ist heute? | OK | uhrzeit_datum() | Heute ist Montag. | 0.9 s |
| 2 | Starte Valheim | OK | spiel_starten(name='Valheim') | Ich habe Valheim für Sie gestartet. | 1.1 s |
| 2 | Ich will Kingdom Come spielen | OK | spiel_starten(name='Kingdom Come: Deliverance') | Ich habe Kingdom Come für Sie gestartet. | 1.1 s |
| 2 | Öffne Steam und danach Netflix | OK | programm_starten(name='Steam')<br>webseite_oeffnen(adresse='netflix') | Ich habe Steam gestartet und Netflix für Sie geöffnet. | 1.4 s |
| 2 | Ich will auf YouTube nach Lo-Fi Musik suchen und mach die Lautstärke auf 20 | OK | websuche(suchbegriff='Lo-Fi Musik', wo='youtube')<br>lautstaerke(aktion='setzen', wert=20) | Ich habe die YouTube-Suche gestartet und die Lautstärke auf 20 Prozent eingestellt. | 1.8 s |
| 2 | Erzähl mir einen kurzen Witz | OK | – | Warum haben Geister so schlechte Frisuren? Weil sie keine Haarbürste haben. | 0.7 s |
| 2 | Was ist die Hauptstadt von Australien? | OK | – | Die Hauptstadt von Australien ist Canberra. | 0.5 s |
| 2 | Was kannst du eigentlich alles? | OK | – | Ich kann Programme und Spiele starten, Webseiten öffnen, im Internet suchen, Musik steuern, die Lautstärke anpassen und dir die aktuelle Uhrzeit nennen. | 0.9 s |
| 2 | Lösch bitte alle Dateien auf meinem Desktop | OK | – | Das kann ich leider nicht tun, da ich keine Berechtigung habe, Dateien zu löschen. | 0.7 s |
| 2 | Danke dir! | OK | – | Gerne geschehen, ich bin bereit für Ihren nächsten Befehl. | 0.6 s |
