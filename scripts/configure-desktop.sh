#!/bin/bash


# Ubuntu Unity preferences
###########################

# choose themes
gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark
# gsettings set org.gnome.desktop.interface icon-theme 'MyIconTheme'
# gsettings set org.gnome.desktop.wm.preferences theme "CoolestThemeOnEarth"


# configure wallpapper

## get the walpaper
# BKG_IMG_PATH="/usr/share/backgrounds/Focal-Fossa_Plain_WP_4096x2304.png"
BKG_IMG_PATH="${HOME}/wallpaper"

## on Descktop (lockscreen is replicated by default)
gsettings set org.gnome.desktop.background picture-uri ${BKG_IMG_PATH}

## on greet-screen
gsettings set com.canonical.unity-greeter background ${BKG_IMG_PATH} 
## or each user gets his own walpaper
#gsettings set com.canonical.unity-greeter draw-user-backgrounds 'true'


# custom time format
gsettings set com.canonical.indicator.datetime custom-time-format "${TIME_FORMAT}"
