@echo off
cd /d "%~dp0"
set "ASPNETCORE_URLS=http://localhost:5080"
echo Iniciando en http://localhost:5080
echo Mantener esta consola abierta.
dotnet run --project "Lab14.Zinanyuca.csproj" --no-launch-profile
pause
