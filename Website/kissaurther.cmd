@echo off
title 🚀 WINDOWS ULTIMATE OPTIMIZATION SCRIPT 🚀

:: 🔥 Request Admin Privileges 🔥
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 🛡️ RUN THIS SCRIPT AS ADMINISTRATOR! 🛡️
    pause
    exit
)

echo ============================================
echo      🚀 MAX FPS WINDOWS BOOST 🚀
echo ============================================
timeout /t 3

:: 1️⃣ **DELETE ALL USELESS JUNK FILES**
echo 🔥 Deleting temporary files...
del /q /f /s "%TEMP%\*"
del /q /f /s "C:\Windows\Temp\*"
del /q /f /s "C:\Windows\Prefetch\*"
del /q /f /s "C:\Windows\SoftwareDistribution\Download\*"
del /q /f /s "C:\$Recycle.Bin\*"

:: 2️⃣ **REMOVE WINDOWS BLOATWARE**
echo 🔥 Removing useless Windows bloatware...
winget uninstall "Microsoft.BingWeather" --silent
winget uninstall "Microsoft.XboxGamingOverlay" --silent
winget uninstall "Microsoft.WindowsCamera" --silent
winget uninstall "Microsoft.MicrosoftStickyNotes" --silent
winget uninstall "Microsoft.MicrosoftSolitaireCollection" --silent
winget uninstall "Microsoft.WindowsFeedbackHub" --silent
winget uninstall "Microsoft.ZuneMusic" --silent
winget uninstall "Microsoft.ZuneVideo" --silent

:: 3️⃣ **DISABLE TELEMETRY & TRACKING**
echo 🔥 Disabling telemetry & tracking services...
sc config DiagTrack start= disabled
sc config dmwappushservice start= disabled
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable

:: 4️⃣ **OPTIMIZE NETWORK SETTINGS FOR MAX SPEED**
echo 🔥 Optimizing network settings for low ping...
ipconfig /release
ipconfig /flushdns
ipconfig /renew
netsh winsock reset
netsh int ip reset
netsh advfirewall reset

:: 5️⃣ **BOOST CPU & GPU PERFORMANCE**
echo 🔥 Enabling ultimate power mode...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /SETACTIVE SCHEME_MIN
powercfg /Change monitor-timeout-ac 0
powercfg /Change monitor-timeout-dc 0
powercfg /Change standby-timeout-ac 0
powercfg /Change standby-timeout-dc 0

:: 6️⃣ **DISABLE UNNECESSARY STARTUP PROGRAMS**
echo 🔥 Disabling startup programs...
wmic startup get caption,command
wmic startup where "caption like '%%'" delete

:: 7️⃣ **STOP BACKGROUND APPS**
echo 🔥 Disabling all background apps...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f

:: 8️⃣ **ENABLE HIGH-PERFORMANCE MODE FOR SSD/HDD**
echo 🔥 Optimizing drive performance...
fsutil behavior set DisableDeleteNotify 0
defrag /C /O

:: 9️⃣ **AUTO-UPDATE ALL DRIVERS**
echo 🔥 Updating drivers...
winget upgrade --all --silent

:: 🔄 **RESTART FOR MAX PERFORMANCE**
echo ✅ All optimizations applied! Restarting for maximum performance...
shutdown /r /t 5