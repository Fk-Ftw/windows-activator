@echo off
:: Check for administrator rights
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running PowerShell activation script as Administrator...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"
    pause
) else (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit
)
