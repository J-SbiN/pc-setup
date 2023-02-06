C:\windows\system32\wsl.exe export DISPLAY=$(ip route list default | awk '{print $3}'):0 && export LIBGL_ALWAYS_INDIRECT=1 && terminator
