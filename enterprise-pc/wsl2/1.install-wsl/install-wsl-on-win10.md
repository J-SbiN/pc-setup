
# Install Linux distribution on WSL2

If you are not found of understanding what you are doing, just [randomly run some commands](#fastlane-randomly-run-some-commands) and... there is a non-null probability of getting what you want!

If you'd like to know your options jump the *FastLane* and go to [](#step-by-step)

## Note That:
- In this tutorial we used:
  - WSL 2
  - Ubuntu (20.04.4)
- Debian based distributions configuration may be similar but working with a different distribution may require a different procedure.
- WSL2 installs the linux distribution (of your choice) on a subnet dedicated to the subsystem. And that is a mess when your company is setting all kinds of proxys and funny routing rules.
- I could only get my configuration to work with the VPN on :/ ....  so...
- You'll need to have your GLS VPN installed and functional.


\
\
\
\
\
\.
# FastLane!! (Randomly Run Some Commands)

If your windows is all up to date, you can run these braindeath and it will probably get you an Linux distro running.

If things go sideways, consider turning your brain on and reading the rest of the tutorial [*Step by Step*](#step-by-step). 

### **Via PowerShell**
Open Windows PowerShell as Administrator and run:
```posh
wsl --install

$uri='https://aka.ms/wslubuntu2004';
$dest="$env:USERPROFILE\Downloads\Ubuntu-2004.AppxBundle"
Invoke-WebRequest -Uri $uri -OutFile $dest

Add-AppxPackage $dest

wsl
```
This should be the bare minimum to get you running an Ubuntu shell.

### **Via GUI**
If you want to do it via GUI
You can replace the `Invoke-WebRequest` and the `Add-AppxPackage` commands with the steps in the [installation via Microsoft Store](#via-microsoft-store).






\
\
\
\
\
\.
# Step by Step

This tutorial was based on the information available on the [Ubuntu WSL Tutorial](https://wiki.ubuntu.com/WSL), the [MS WSL Installation Manual](https://docs.microsoft.com/en-us/windows/wsl/install-manual) and the [MS WSL Custom Distro Tutorial](https://docs.microsoft.com/en-us/windows/wsl/use-custom-distro). For in depth information, please refer to those. Any other information was probably retrieved from [StackOverflow](https://stackoverflow.com/).


\
\.
## Enabling WSL2

WSL is still an optional feature on Windows. As so, you need to turn it on. You can do that using the GUI, or my personal favorite a command line.

If you do not have WSL installed yet, open a Windows Powershell console as Administrator and run the following:
```posh
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --install
```
This should get your WSL installed.

If you already got WSL installed, on an Admin Powershell, we want to make sure we get the windows kernel update (to be able to use wsl2): 
```posh
$uri='https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi'
$dest="$env:USERPROFILE\Downloads\wsl_update_x64.msi"
Invoke-WebRequest -Uri $uri -OutFile $dest
msiexec -fav $dest
```

Yet on the same shell, lets just set our WSL to WSL2:
```posh
wsl --set-default-version 2
```

If you had previous Linux distributions installed, make sure to find out their names with `wsl --list --verbose`, and update them to WSL2 with `wsl --set-version <Distro-Name> 2`.


\
\.
## Getting Your Favorite Distros

There are several different ways of getting a Linux distribution to be used under the WSL2. Each method is tailored for a specific type of packaging or distributing mechanism. As some distros may only be available in a specific packaging or distributing mechanism, you may need to use the different methods.


### **Via Microsoft Store**
Though this may be blocked by company policies, it is, of course, the preferred method:
1. On the App Store, serach for "Run Linux on Windows";
2. Select your favorite Distro and click `<Get>`;
3. Wait for the installation to go through - you'll need to provide a username and password to create the Linux user;


### **Via .appx file (sidelowding)**
If you get your hands on an .appx but can't or won't install it via the store, you can sideload it using the following command:
```posh
Add-AppxPackage <Path\to\your\package.appx>
```
This has the downside of relaying on you to keep that software updated.


### **Via filesystem (.tar/.gz/.xz/.zip/.img/...)**
Yet another way of getting your distro is from a snapshot of that distro.

This is the way that provides you with more options and the possibility of customization. However it also binds you to completely manage the install/uninstall/update processes.

You can get any snapshot you trust and run the following (remember to adjust the first two/three lines):
```posh
$distroName='your-distro-name'
$snapFile="path-to-your-snapshot-file"
$installPath="$env:USERPROFILE\wsl-distros\$distroName"
$wslVersion=2
mkdir $installPath
wsl --import $distroName $installPath $snapFile $wslVersion
```

#### **Bonus - Getting a tar file from a docker container**
If you want to get into customizing your distro, check the [MS WSL Use Custom Distro](https://docs.microsoft.com/en-us/windows/wsl/use-custom-distro) tutorial. You may need to install a non-custom distro, or create the .tar file in another machine - but you can even publish on docker hub or on microsoft wsl distros repo your own distro and reuse it on the fly on another machine.


\
\.
## Running the Distro under WSL2

If the Linux shell is not running at the end of this, just open powershell, find the name of your distro with `wsl --list` and run `wsl -d <Distro-Name>`




# Tools / Toolchain