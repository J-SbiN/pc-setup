# Configuring Linux under WSL



## Configuring Network on WSL

1. Get down to the WSL command line
   1. Open cmd:
        ```text
        press:  <Win> + R
        type:   cmd
        press:  <enter>
        ```
   2. Open your Linux distribution
        ```cmd
        wsl [-d <distribution>]
        ```
2. Prevent WSL from overwriting the files you'll be changing [*](#please-note-that)
    1. create or go into wsl.conf
        ```bash
        sudo vim /etc/wsl.conf
        ```
    2. Add the following lines:
        ```bash
        [network]
        generateResolvConf = false
        generateHosts = false
        ```
3. Tell WSL where to look for DNS resolution
    1. Go into your resolv.conf
        ```bash
        sudo vim /etc/resolv.conf
        ```
    2. Add your company machines to it. For GLS:
        ```bash
        nameserver 172.28.32.1
        nameserver 10.3.76.173
        nameserver 10.232.100.173
        nameserver 192.168.1.254
        ```
4. Set aptitude free (this should't be necessary - I'm not fully understanding)
    1. Create a Proxy
        1. Go in /etc/hosts 
            ```bash
            sudo vim /etc/hosts
            ```
        2. And add the following line
            ```bash
            193.106.225.65  gls-proxy #proxy.gls-group.eu
            ```
    2. Make apt use a proxy
        1. create or go into the apt.conf
            ```bash
            sudo vim /etc/apt/apt.conf
            ```
        2. add the following line  
            ```bash
            Acquire::http::Proxy "http://proxy:8080";
            ```





## Config Graphic Apps

1. instal VcXsrv
    1. [Download VcXsrv installer](https://sourceforge.net/projects/vcxsrv/files/latest/download)
    2. install it
2. script to start vcxsrv:
    1. create a vcxsrv.cmd containing:
        ```batch
        :: check if VcXsrv is already running
        tasklist | find "vcxsrv.exe"

        :: if not, start it 
        if errorlevel 1 start /d "C:\Program Files\VcXsrv" vcxsrv.exe :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto
        ```
    3. save it where you see fit
3. Add the script to the start up programs
    1. create a shortcut (you are about to move it)
    2. Hit <Win>+<R>, then type shell:startup and push <Enter>
    3. move the shortcut in there. (should be something like: "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup")
4. Add the script to the "Start Menu"
    1. On the directory of your batch hit <right-click> --> <New> --> <Shortcut>
    2. In the shortcut target type the following text:
        cmd /c "full path to your batch file"
    3. Name the shortcut.
    4. Hit <right-click> on the shortcut --> <Pin to Start>.
5. Direct the linux graphical enviroment to your monitor
   1. install a grphic conector dbus-x11 or x11-apps
        ```bash
        sudo apt install x11-apps
        ```
   2. go inside your ~/.bashrc 
        ```bash
        vim ~/.bashrc
        ```
   3. and add the lines to point the display to the right IP
        ```bash
        export DISPLAY=$(ip route list default | awk '{print $3}'):0
        export LIBGL_ALWAYS_INDIRECT=1
        ```




https://wiki.ubuntu.com/WSL#Advanced_Topics


