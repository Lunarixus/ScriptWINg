title "ScriptWINg: Hidden Features"
cls

net session >nul 2>nul
net session >nul 2>nul
if not "%errorlevel%" == "0" (
	echo "You must run the script as an administrator."
	pause
	exit /b 1
)

echo "    - Beginning hidden config changes"
rem Disk Management in Settings
1>NUL "%~dp0ViVeTool.exe" addconfig 23257398 2
rem Windows 10X Touch Keyboard
1>NUL "%~dp0ViVeTool.exe" addconfig 20438551 2
rem Theme-aware Live Tiles
1>NUL "%~dp0ViVeTool.exe" addconfig 23615618 2
rem Media Controls in Volume Flyout
1>NUL "%~dp0ViVeTool.exe" addconfig 23403403 2
1>NUL "%~dp0ViVeTool.exe" addconfig 23674478 2
rem About Page in Settings
1>NUL "%~dp0ViVeTool.exe" addconfig 25175482 2
rem Theme-aware Splashscreens
1>NUL "%~dp0ViVeTool.exe" addconfig 25936164 2
rem Meet Now Integration
1>NUL "%~dp0ViVeTool.exe" addconfig 28170999 2
1>NUL "%~dp0ViVeTool.exe" addconfig 28582629 2
1>NUL "%~dp0ViVeTool.exe" addconfig 28758888 2
1>NUL "%~dp0ViVeTool.exe" addconfig 28622680 2
1>NUL "%~dp0ViVeTool.exe" addconfig 28622690 2
rem GPU Information in Settings About Page
1>NUL "%~dp0ViVeTool.exe" addconfig 27974039 2
rem Split Layout for Windows 10X
1>NUL "%~dp0ViVeTool.exe" addconfig 23881110 2
rem Profile Header in Settings
1>NUL "%~dp0ViVeTool.exe" addconfig 18299130 2
rem Windows 10X OOBE
1>NUL "%~dp0ViVeTool.exe" addconfig 26336822 2
rem App Archival
1>NUL "%~dp0ViVeTool.exe" addconfig 21206371 2
1>NUL "%~dp0ViVeTool.exe" addconfig 28384772 2

echo "    - Enabling News and Interests"
echo "If you do not wish to have this feature, please skip this section."
set /P c="Type 'Y' to continue, or 'N' to skip: "
if /I "%c%" EQU "N" goto NoNewsFeed

rem News and Interests
1>NUL "%~dp0ViVeTool.exe" addconfig 29947361 2
1>NUL "%~dp0ViVeTool.exe" addconfig 27833282 2
1>NUL "%~dp0ViVeTool.exe" addconfig 27368843 2
1>NUL "%~dp0ViVeTool.exe" addconfig 28247353 2
1>NUL "%~dp0ViVeTool.exe" addconfig 27371092 2
1>NUL "%~dp0ViVeTool.exe" addconfig 27371152 2
1>NUL "%~dp0ViVeTool.exe" addconfig 30803283 2
1>NUL "%~dp0ViVeTool.exe" addconfig 30213886 2

:NoNewsFeed
rem x86_64 Emulation for ARM
if "%PROCESSOR_ARCHITECTURE%" == "ARM64" (
	1>NUL "%~dp0ViVeTool.exe" addconfig 24819336 2
	1>NUL "%~dp0ViVeTool.exe" addconfig 29359153 2
)

echo "    - Beginning registry changes"
rem Windows 10X Boot Animation
1>NUL reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\BootControl" /v BootProgressAnimation /t REG_DWORD /d "1" /f
rem Windows Rounded UI
1>NUL reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search\Flighting" /v ImmersiveSearch /t REG_DWORD /d "1" /f
1>NUL reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search\Flighting\Override" /v ImmersiveSearchFull /t REG_DWORD /d "1" /f
1>NUL reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search\Flighting\Override" /v CenterScreenRoundedCornerRadius /t REG_DWORD /d "9" /f

cls
exit /b 0
