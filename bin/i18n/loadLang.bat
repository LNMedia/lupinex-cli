@echo off
setlocal EnableDelayedExpansion

:: Basis: Diese Datei muss mit %lang% aufgerufen werden (z.?B. "de" oder "en")
:: Beispiel: call loadLang.bat de

:: Sprache festlegen (über Parameter oder bestehende Variable)
if not "%~1"=="" set lang=%~1

:: Lade Sprachdatei dynamisch
for /f "tokens=1,* delims==" %%A in (%~dp0%lang%.txt) do (
    set "%%A=%%B"
)

endlocal & (
    for /f "tokens=1,* delims==" %%A in (%~dp0%lang%.txt) do (
        set "%%A=%%B"
    )
)
