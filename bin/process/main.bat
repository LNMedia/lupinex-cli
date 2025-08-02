:: WIP
@echo off

setlocal EnableDelayedExpansion
chcp 65001 >nul

:: Activate ANSI for color coding
for /f "delims=" %%A in ('"prompt $H & for %%B in (1) do rem"') do set "BS=%%A"
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1

:: Window title
title "LNX-CLI Tool - Main Menu"
timeout /t 1 >nul


:: Main branch
:main

rem Load language
set "lang=en"
call "bin\i18n\loadLang.bat" %lang%

rem Window settings
mode con: cols=80 lines=40
cls

echo.
ping -n 1 -w 350 127.0.0.1 >nul
call bin\process\ascii_logo.bat
echo.
echo.
ping -n 1 -w 350 127.0.0.1 >nul

echo Welcome to the interactive [96mLNX[90m-[37mCommand[90m-[37mLine[90m-[37mInterface [90m(v1.0.0)[0m.
ping -n 1 -w 350 127.0.0.1 >nul
echo.
echo Use [90m'[33mhelp[90m'[0m for all available commands.
echo Enjoy working with LNX CLI — your powerful command-line partner. 
echo.
echo.

:: Add loop for menu
:loop
<nul set /p="[90m[[96mLNX[90m] > [0m"
set /p USERINPUT=

:: Main commands
if /i "!USERINPUT!"=="exit" goto quit rem Exit CLI
if /i "!USERINPUT!"=="help" goto help rem Show help
if /i "!USERINPUT!"=="settings" goto settings rem Open settings menu
if /i "!USERINPUT!"=="clear" goto main rem Clean window
if /i "!USERINPUT!"=="cc" goto main rem Clean window


:: Unknown command
echo.
echo [90m[[1;91mERROR[90m][97m Unknown command: [93m!USERINPUT![0m. Type [90m'[1;33mhelp[90m'[0m or [90m'[1;33mcommands[90m'[0m for a list of commands.
echo.
ping -n 1 -w 500 127.0.0.1 >nul
goto loop


:: Command actions
:help
call bin\commands\main\help.bat
goto loop



:quit
echo.
echo [90m[INFO][97m LNX-CLI Tool wird beendet...[0m
timeout /t 1 >nul
endlocal
exit /b