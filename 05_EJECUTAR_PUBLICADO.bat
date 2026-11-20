@echo off
cd /d "%~dp0"
if not exist "Publicado\Lab14.Zinanyuca.dll" (
  echo Primero ejecuta 02_PUBLICAR_RELEASE.bat
  pause
  exit /b 1
)
cd /d "%~dp0Publicado"
set "ASPNETCORE_URLS=http://localhost:5081"
echo Ejecutando archivos PUBLICADOS en http://localhost:5081
dotnet "Lab14.Zinanyuca.dll"
pause
