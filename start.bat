@echo off
cd /d "%~dp0"
powershell -NoProfile -Command "try { if ((Invoke-WebRequest -Uri 'http://127.0.0.1:4317/' -TimeoutSec 1).StatusCode -eq 200) { exit 0 } else { exit 1 } } catch { exit 1 }" >nul 2>nul
if %errorlevel%==0 (echo The app is already running at http://127.0.0.1:4317 & pause & exit /b 0)
where node >nul 2>nul || (echo Node.js not found. See README.md & pause & exit /b 1)
where ffmpeg >nul 2>nul || (echo FFmpeg not found. See README.md & pause & exit /b 1)
where ffprobe >nul 2>nul || (echo ffprobe not found. See README.md & pause & exit /b 1)
echo Open http://127.0.0.1:4317 in your browser.
node server.js
pause
