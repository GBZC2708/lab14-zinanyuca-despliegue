@echo off
cd /d "%~dp0"
echo === DOTNET SDK ===
dotnet --version
echo.
echo === RUNTIMES INSTALADOS ===
dotnet --list-runtimes
echo.
echo === GIT ===
git --version
pause
