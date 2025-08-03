mode con: cols=100 lines=40
cls

echo ----------------------------------------------------
echo     Disk Maintenance: Defragmentation and chkdsk
echo ----------------------------------------------------
echo.

call :DiskMaintenance

echo.
echo Finished checking all drives.
exit /b

:DiskMaintenance
rem --- Find all local drives (DriveType 3 means local fixed hard disks) ---
for /f "skip=1 tokens=1" %%D in ('wmic logicaldisk where "drivetype=3" get caption') do (
    rem Check if the drive letter is not empty (to avoid blank lines)
    if not "%%D"=="" (
        rem --- Get the volume name of the drive ---
        rem The "vol" command outputs something like "Drive C: Volume Serial Number is XXXX"
        for /f "usebackq tokens=*" %%N in (`vol %%D 2^>nul`) do set "volname=%%N"
        
        rem --- Extract the actual volume name from the output ---
        rem The volume name is typically the 5th token onward in the vol output string
        for /f "tokens=5,* delims= " %%a in ("!volname!") do set "volname=%%b"
        
        rem If no volume name found, set it to "No Name"
        if "!volname!"=="" set "volname=No Name"
        
        rem Call the ProcessDrive subroutine with the drive letter and volume name
        call :ProcessDrive %%D "!volname!"
    )
)

:ProcessDrive
rem --- Assign passed parameters to variables for easier use ---
set "drive=%~1"
set "name=%~2"

echo.
echo -----------------------------------------------------
echo Drive: %drive%
echo %name%
echo -----------------------------------------------------

:chooseDefrag
rem --- Ask user whether to defragment (for HDD), optimize (for SSD) or skip ---
set /p defragtype=Defragmentation or Optimization for %drive%? (D=Defrag HDD / O=Optimize SSD / S=Skip): 

if /i "%defragtype%"=="D" (
    rem User chose defragmentation for HDD
    echo Starting defragmentation for %drive%...
    defrag %drive% /U /V
    echo.
) else if /i "%defragtype%"=="O" (
    rem User chose optimization for SSD
    echo Starting optimization for %drive%...
    defrag %drive% /O /U /V
    echo.
) else if /i "%defragtype%"=="S" (
    rem User chose to skip defrag/optimization
    echo Skipping defrag/optimization for %drive%.
    echo.
) else (
    rem Invalid input, ask again
    echo Invalid input. Please enter D, O or S.
    echo.
    goto chooseDefrag
)

:chooseChkdsk
rem --- Ask user if they want to run chkdsk for this drive ---
set /p chkdskinput=Do you want to run chkdsk for %drive%? (Y=Yes / N=No): 
if /i "%chkdskinput%"=="Y" goto chkdskType
if /i "%chkdskinput%"=="N" goto skipChkdsk

rem Invalid input, ask again
echo Invalid input. Please enter Y or N.
echo.
goto chooseChkdsk

:chkdskType
rem --- Ask which chkdsk mode to run ---
set /p chkdsktype=Which chkdsk mode? (1=Normal scan / 2=Scan with restart): 

if "%chkdsktype%"=="1" (
    rem Normal chkdsk scan (online, no reboot)
    echo Starting normal chkdsk scan for %drive%...
    chkdsk %drive% /scan
    echo.
    goto afterChkdsk
)
if "%chkdsktype%"=="2" (
    rem Full chkdsk with fix and recovery, runs on next reboot
    echo chkdsk for %drive% will run on restart...
    chkdsk %drive% /f /r
    echo.
    goto afterChkdsk
)

rem Invalid input, ask again
echo Invalid input. Please enter 1 or 2.
goto chkdskType

:skipChkdsk
rem User chose to skip chkdsk
echo Skipping chkdsk for %drive%.
echo.
goto afterChkdsk

:afterChkdsk
echo.
echo ---------------------------------------------
echo     Disk Maintenance completed!
echo ---------------------------------------------