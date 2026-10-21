@echo off
rem Startet Jarvis: Nebel als Desktop-Hintergrund (oberer Monitor) + Chat im Fenster. Fenster schließen = Jarvis beenden.
cd /d "%~dp0"
title Jarvis
.venv\Scripts\python -m assistent.jarvis
pause
