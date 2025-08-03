:: Input loop
:loop
<nul set /p="[90m[[96mLNX[90m] > [0m"
set /p USERINPUT=

call :run_command !USERINPUT!
goto loop


:: Run command subroutine
:run_command
set "CMD_FOUND=false"
for /f "tokens=1* delims==" %%a in ('findstr /i /r "  %1=" data\commands\commands.ini') do (
    set CMD_ACTION=%%b
    set CMD_FOUND=true
)

if "!CMD_FOUND!"=="true" (
    call data\commands\executer.bat !CMD_ACTION!
) else (
    echo.
    echo !translate.unknowncommand! !USERINPUT!!translate.unknowncommand1!
    echo.
    ping -n 1 -w 500 127.0.0.1 >nul
)