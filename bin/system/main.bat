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


:: Language branch
:language

rem Load/set language
set "lang="
for /f "tokens=1* delims==" %%A in ('findstr /i "^lang=" data\config.ini') do (
    set "lang=%%B"
)

if not defined lang (
    echo.
    echo [96m[SETUP][0m No language configured.
    <nul set /p="[96m[SETUP][0m Please choose your preferred language ([93mde[0m / [93men[0m): "
    set /p lang=
    
    rem Validate language
    if /i not "!lang!"=="de" if /i not "!lang!"=="en" (
        echo Unknown language.  [93men[0m gesetzt.
        goto main
    )

    if not exist data\config.ini (
        echo [system]> data\config.ini
    )

    call :set_config "lang" "!lang!"
)

call "data\i18n\loadLang.bat" %lang%


:: --- Subroutine: Set config value under [system] ---
goto main

:set_config
set "key=%~1"
set "val=%~2"
set "in_system_section=false"
set "updated=false"

> "data\config.tmp" (
    for /f "usebackq tokens=*" %%L in ("data\config.ini") do (
        set "line=%%L"

        echo !line! | findstr /r "^\[.*\]" >nul
        if !errorlevel! == 0 (
            if "!in_system_section!"=="true" if "!updated!"=="false" (
                echo !key!=!val!
                set "updated=true"
            )
            if /i "!line!"=="[system]" (
                set "in_system_section=true"
            ) else (
                set "in_system_section=false"
            )
            echo !line!
        ) else (
            if "!in_system_section!"=="true" (
                echo !line! | findstr /i "^!key!=" >nul
                if !errorlevel! == 0 (
                    echo !key!=!val!
                    set "updated=true"
                ) else (
                    echo !line!
                )
            ) else (
                echo !line!
            )
        )
    )

    if "!updated!"=="false" (
        echo.
        echo [system]
        echo !key!=!val!
    )
)

move /y "data\config.tmp" "data\config.ini" >nul
exit /b


rem Window settings
:main
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