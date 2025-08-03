echo ---------------------------------------------
echo     Running Windows Cleanup...
echo ---------------------------------------------

rem Cleaning user TEMP folder
echo [*] Deleting user TEMP folder (%TEMP%)...
if exist "%TEMP%" rd /s /q "%TEMP%" 2>nul
mkdir "%TEMP%" 2>nul
echo.

rem Cleaning system TEMP folder
echo [*] Deleting system TEMP folder (%WINDIR%\Temp)...
if exist "%WINDIR%\Temp" rd /s /q "%WINDIR%\Temp" 2>nul
mkdir "%WINDIR%\Temp" 2>nul
echo.

rem Clearing Prefetch data
echo [*] Deleting Prefetch data...
if exist "%WINDIR%\Prefetch" del /s /f /q "%WINDIR%\Prefetch\*" 2>nul
echo.

rem Clearing Windows Error Reporting
echo [*] Clearing Windows Error Reporting folder...
if exist "%LOCALAPPDATA%\Microsoft\Windows\WER" rd /s /q "%LOCALAPPDATA%\Microsoft\Windows\WER" 2>nul
mkdir "%LOCALAPPDATA%\Microsoft\Windows\WER" 2>nul
echo.

rem Cleaning Windows Update cache
echo [*] Stopping Windows Update service...
net stop wuauserv >nul 2>&1
echo [*] Deleting SoftwareDistribution\Download folder...
if exist "%WINDIR%\SoftwareDistribution\Download" rd /s /q "%WINDIR%\SoftwareDistribution\Download" 2>nul
mkdir "%WINDIR%\SoftwareDistribution\Download" 2>nul
echo [*] Starting Windows Update service...
net start wuauserv >nul 2>&1
echo.

rem Deleting Windows log files
echo [*] Deleting Windows log files...
del /s /f /q "%WINDIR%\Logs\*" 2>nul
echo.

rem Clearing Delivery Optimization cache
echo [*] Deleting Delivery Optimization cache...
if exist "%ProgramData%\Microsoft\Windows\DeliveryOptimization\Cache" rd /s /q "%ProgramData%\Microsoft\Windows\DeliveryOptimization\Cache" 2>nul
mkdir "%ProgramData%\Microsoft\Windows\DeliveryOptimization\Cache" 2>nul
echo.

rem Deleting additional system caches
echo [*] Deleting additional system caches...
del /s /f /q "%WINDIR%\SoftwareDistribution\EventCache\*" 2>nul
del /s /f /q "%WINDIR%\System32\LogFiles\*" 2>nul
del /s /f /q "%APPDATA%\Microsoft\Teams\Cache\*" 2>nul
del /s /f /q "%APPDATA%\Microsoft\Teams\blob_storage\*" 2>nul
del /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
echo.

rem Deleting IE Temporary Internet Files
echo [*] Removing IE cache (INetCache)...
for /d %%D in ("%LOCALAPPDATA%\Microsoft\Windows\INetCache\*") do rd /s /q "%%D" 2>nul
echo.

rem Emptying Recycle Bin
echo [*] Emptying Recycle Bin...
PowerShell -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
echo.

rem Deleting browser caches (closing browsers first)
echo [*] Closing browsers to clear caches...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im brave.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1
echo.

echo [*] Deleting Brave cache...
if exist "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache" rd /s /q "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache" 2>nul
echo.

echo [*] Deleting Chrome cache...
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
echo.

echo [*] Deleting Edge cache...
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" 2>nul
echo.

echo [*] Deleting Firefox cache...
for /d %%P in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
    if exist "%%P\cache2" rd /s /q "%%P\cache2" 2>nul
    if exist "%%P\startupCache" rd /s /q "%%P\startupCache" 2>nul
)

echo.
echo ---------------------------------------------
echo     Cleanup completed!
echo ---------------------------------------------