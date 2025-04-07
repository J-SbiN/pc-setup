#!/bin/bash


# Ubuntu preferences
#####################

# choose themes
gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark
# gsettings set org.gnome.desktop.interface icon-theme 'MyIconTheme'
# gsettings set org.gnome.desktop.wm.preferences theme "CoolestThemeOnEarth"

## dark-mode
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

## configure wallpapper
gsettings set org.gnome.desktop.background picture-uri-dark 'file:///'${HOME}'/repos/pc-setup/resources/noble-numbat-3840x2160-plain.png'

# get the walpaper
# BKG_IMG_PATH="/usr/share/backgrounds/Focal-Fossa_Plain_WP_4096x2304.png"
#BKG_IMG_PATH="${HOME}/wallpaper"

# on Descktop (lockscreen is replicated by default)
#gsettings set org.gnome.desktop.background picture-uri ${BKG_IMG_PATH}

# on greet-screen
#gsettings set com.canonical.unity-greeter background ${BKG_IMG_PATH} 
# or each user gets his own walpaper
#gsettings set com.canonical.unity-greeter draw-user-backgrounds 'true'


##  Top Bar configs

# display batery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# display seconds on clock
gsettings set org.gnome.desktop.interface clock-show-seconds true

# display weekday on date
gsettings set org.gnome.desktop.interface clock-show-weekday true

# custom time format
#gsettings set com.canonical.indicator.datetime custom-time-format "${TIME_FORMAT}"



## Home Button on Desktop?!
gsettings set org.gnome.shell.extensions.ding show-home false

## Place new desctop icons from top-left
gsettings set org.gnome.shell.extensions.ding start-corner 'top-left'

## Desktop Icon Size small
gsettings set org.gnome.shell.extensions.ding icon-size 'small'



## Dock configs

# auto-hide bar even if no window is open
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock autohide 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide 'false'

# dock icon-size
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size '36'

# unpin all icons

# pin desired icons
