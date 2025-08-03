:: Main init
@echo off

setlocal EnableDelayedExpansion
chcp 65001 >nul

rem Activate ANSI for color coding
for /f "delims=" %%A in ('"prompt $H & for %%B in (1) do rem"') do set "BS=%%A"
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1

rem Window title
title "LNX-CLI Tool - Main Menu"
timeout /t 1 >nul


:: Start main branch
:main

rem Load language
set "lang=en"
call "data\i18n\loadLang.bat" %lang%

rem Window settings
mode con: cols=80 lines=40
cls

echo.
ping -n 1 -w 350 127.0.0.1 >nul
call bin\system\ascii_logo.bat
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


:: Call enter prompt
call data\commands\handler.bat