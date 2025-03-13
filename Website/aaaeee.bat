@echo off
:: Advanced Batch Script to Optimize Windows 10/11

:: Check for administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as administrator.
    pause
    exit /b
)

:: Disable unnecessary services
echo Disabling unnecessary services...
sc config diagtrack start= disabled
sc stop diagtrack
sc config dmwappushservice start= disabled
sc stop dmwappushservice
sc config XblGameSave start= disabled
sc stop XblGameSave
sc config XboxNetApiSvc start= disabled
sc stop XboxNetApiSvc
sc config WSearch start= disabled
sc stop WSearch
sc config SysMain start= disabled
sc stop SysMain
sc config WMPNetworkSvc start= disabled
sc stop WMPNetworkSvc
sc config WerSvc start= disabled
sc stop WerSvc
sc config RetailDemo start= disabled
sc stop RetailDemo
sc config shpamsvc start= disabled
sc stop shpamsvc
sc config OneSyncSvc start= disabled
sc stop OneSyncSvc
sc config MessagingService start= disabled
sc stop MessagingService

:: Disable Windows Update (if desired)
echo Disabling Windows Update...
sc config wuauserv start= disabled
sc stop wuauserv

:: Set power plan to high performance
echo Setting power plan to high performance...
powercfg /s SCHEME_MIN

:: Disable hibernation
echo Disabling hibernation...
powercfg -h off

:: Adjust visual effects for best performance
echo Adjusting visual effects for best performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

:: Disable Startup Programs
echo Disabling startup programs...
wmic startup where "not User='NT AUTHORITY\\SYSTEM' and not User='NT AUTHORITY\\LOCAL SERVICE'" call disable

:: Clean up temporary files
echo Cleaning up temporary files...
del /s /f /q %temp%\*
rd /s /q %temp%

:: Disk cleanup
echo Performing disk cleanup...
cleanmgr /sagerun:1

:: Disable unnecessary scheduled tasks
echo Disabling unnecessary scheduled tasks...
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Maintenance\WinSAT" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyRefresh" /DISABLE
schtasks /Change /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /DISABLE

:: Optimize system settings
echo Optimizing system settings...

:: Increase system responsiveness
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 00000000 /f

:: Increase network performance
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f

:: Optimize SSD performance
echo Optimizing SSD performance...
fsutil behavior set DisableDeleteNotify 0

:: Disable notifications and tips
echo Disabling notifications and tips...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f

:: Disable background apps
echo Disabling background apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f

:: Disable telemetry
echo Disabling telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: Disable prefetch and superfetch
echo Disabling prefetch and superfetch...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f

:: Disable Windows Defender (if desired)
echo Disabling Windows Defender...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
sc config WinDefend start= disabled
sc stop WinDefend

:: Optimize system file checker
echo Running system file checker...
sfc /scannow

:: Clean up Windows Update cache
echo Cleaning up Windows Update cache...
net stop wuauserv
rd /s /q %SystemRoot%\SoftwareDistribution
net start wuauserv

:: Disable system restore
echo Disabling system restore...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v RPSessionInterval /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v DisableSR /t REG_DWORD /d 1 /f

:: Clear DNS cache
echo Clearing DNS cache...
ipconfig /flushdns

:: Disable Fast Startup
echo Disabling Fast Startup...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

:: Disable Cortana
echo Disabling Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f

:: Disable Remote Assistance
echo Disabling Remote Assistance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f

:: Disable Error Reporting
echo Disabling Error Reporting...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f

:: Finishing up
echo Optimization complete. Please restart your computer for all changes to take effect.
pause
exit