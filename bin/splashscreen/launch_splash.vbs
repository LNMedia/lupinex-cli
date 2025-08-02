Set objShell = CreateObject("Wscript.Shell")
objShell.CurrentDirectory = "bin\splashscreen"
objShell.Run "powershell.exe -STA -ExecutionPolicy Bypass -File ""splash.ps1""", 0, True