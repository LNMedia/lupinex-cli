if not "%~1"=="" set lang=%~1

for /f "tokens=1,* delims==" %%A in (%~dp0%lang%.ini) do (
    set "%%A=%%B"
)

endlocal & (
    for /f "tokens=1,* delims==" %%A in (%~dp0%lang%.ini) do (
        set "%%A=%%B"
    )
)