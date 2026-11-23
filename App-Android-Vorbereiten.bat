@echo off
setlocal
cd /d "%~dp0"

echo === BEYOND THE SIGNAL: Android vorbereiten ===
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js wurde nicht gefunden. Bitte Node.js 22+ installieren.
  pause
  exit /b 1
)

for /f "tokens=1 delims=." %%v in ('node -p "process.versions.node"') do set NODE_MAJOR=%%v
if %NODE_MAJOR% LSS 22 (
  echo Node.js 22 oder neuer wird benoetigt.
  pause
  exit /b 1
)

echo [1/4] Abhaengigkeiten installieren...
call npm install
if errorlevel 1 goto error

echo [2/4] Web-Dateien vorbereiten...
call npm run prepare:web
if errorlevel 1 goto error

echo [3/4] Android-Projekt erzeugen, falls es noch fehlt...
if not exist android (
  call npx cap add android
  if errorlevel 1 goto error
)

echo [4/4] Android synchronisieren...
call npx cap sync android
if errorlevel 1 goto error

echo Fertig. Jetzt Android Studio oeffnen und das Projekt starten.
call npx cap open android
pause
exit /b 0

:error
echo Ein Schritt ist fehlgeschlagen. Bitte die Meldung oben pruefen.
pause
exit /b 1
