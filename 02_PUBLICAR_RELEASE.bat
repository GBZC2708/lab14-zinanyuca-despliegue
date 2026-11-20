@echo off
cd /d "%~dp0"
echo === RESTAURAR ===
dotnet restore "Lab14.Zinanyuca.csproj"
if errorlevel 1 goto error
echo.
echo === PUBLICAR RELEASE NET8 ===
dotnet publish "Lab14.Zinanyuca.csproj" --configuration Release --framework net8.0 --output "%~dp0Publicado"
if errorlevel 1 goto error
echo.
echo ARCHIVOS PUBLICADOS:
dir "%~dp0Publicado"
echo.
echo PROCESO FINALIZADO CORRECTAMENTE.
pause
exit /b 0
:error
echo.
echo ERROR: revisa las lineas anteriores.
pause
exit /b 1
