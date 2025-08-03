:: Redirect to execution
if "%~1"=="" (
    goto :eof
)
goto %1


:: Command executer

rem Main commands
:clear
    call bin\system\main.bat :main
    goto :eof

:help
    call data\commands\main\help.bat
    goto :eof

:settings
    call data\commands\main\settings.bat
    goto :eof

:quit
    echo.
    echo [90m[INFO][97m LNX-CLI Tool wird beendet...[0m
    timeout /t 1 >nul
    endlocal
    exit

rem Optimization Commands
:cleanup
    call data\commands\optimization\cleanup.bat
    timeout /t 1 >nul
    call bin\system\main.bat :main
    goto :eof

:optimization
    call data\commands\optimization\defrag.bat
    timeout /t 1 >nul
    call bin\system\main.bat :main
    goto :eof