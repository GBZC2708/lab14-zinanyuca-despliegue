@echo off
echo La consola 03_EJECUTAR_LOCAL.bat debe seguir abierta.
start "" "http://localhost:5080"
start "" "http://localhost:5080/api/estado"
start "" "http://localhost:5080/health"
pause
