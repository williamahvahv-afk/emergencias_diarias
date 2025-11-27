@echo off
setlocal enabledelayedexpansion
set PORT=8000
pushd %~dp0
echo Iniciando servidor en http://localhost:%PORT%/
start "" msedge "http://localhost:%PORT%/index.html" 2>nul || start "" chrome "http://localhost:%PORT%/index.html" 2>nul || start "" "http://localhost:%PORT%/index.html"
where python >nul 2>nul
if not errorlevel 1 (
  python -m http.server %PORT%
) else (
  powershell -NoP -C "Start-Process http://localhost:%PORT%/index.html; cd \"$pwd\"; python -m http.server %env:PORT%"
)
popd
