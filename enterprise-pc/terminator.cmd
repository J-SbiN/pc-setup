
:: check if VcXsrv is already running
tasklist | find "vcxsrv.exe"

:: if not, start it 
if errorlevel 1 start /d "C:\Program Files\VcXsrv" vcxsrv.exe :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto


:: lastly, launch terminator inside WSL
::wsl "export DISPLAY=$(ip route list default | awk '{print $3}'):0 && export LIBGL_ALWAYS_INDIRECT=1 && terminator &"
bash -c "export DISPLAY=$(ip route list default | awk '{print $3}'):0 && export LIBGL_ALWAYS_INDIRECT=1 && echo $DISPLAY; terminator"
