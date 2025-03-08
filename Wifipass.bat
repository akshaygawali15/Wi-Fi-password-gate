@echo off
cls
echo Scanning for available Wi-Fi networks...
echo --------------------------------------
netsh wlan show networks | findstr "SSID"
echo.

echo Checking currently connected Wi-Fi...
for /f "tokens=2 delims=:" %%A in ('netsh wlan show interfaces ^| findstr "SSID"') do (
    set "CONNECTED_WIFI=%%A"
)

echo Connected Wi-Fi: %CONNECTED_WIFI%
echo --------------------------------------

echo.
echo Press 1 to view the Wi-Fi password, or any other key to exit.
set /p choice="Enter your choice: "

if "%choice%"=="1" (
    echo.
    echo Retrieving Wi-Fi password...
    netsh wlan show profile name=%CONNECTED_WIFI% key=clear | findstr "Key Content"
) else (
    echo Exiting...
)

pause
