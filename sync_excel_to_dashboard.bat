@echo off
REM ==== Sincroniza emergencias.xlsx desde una carpeta origen cada 10 minutos ====
REM EDITA LA RUTA ORIGEN:
set SRC=C:\COE\SALIDA
set DST=%~dp0
echo Sincronizando emergencias.xlsx desde "%SRC%" hacia "%DST%" cada 10 minutos...
:loop
robocopy "%SRC%" "%DST%" emergencias.xlsx /XO /R:1 /W:1 >nul
timeout /t 600 /nobreak >nul
goto loop
