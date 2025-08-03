@echo off
setlocal EnableDelayedExpansion

if not "%~1"=="" set lang=%~1

for /f "tokens=1,* delims==" %%A in (%~dp0%lang%.txt) do (
    set "%%A=%%B"
)

endlocal & (
    for /f "tokens=1,* delims==" %%A in (%~dp0%lang%.txt) do (
        set "%%A=%%B"
    )
)