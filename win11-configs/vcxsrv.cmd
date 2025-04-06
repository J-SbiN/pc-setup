
:: check if VcXsrv is already running
tasklist | find "vcxsrv.exe"

:: if not, start it 
if errorlevel 1 start /d "C:\Program Files\VcXsrv" vcxsrv.exe :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto
