#!/bin/bash

#


# Terminal Preferences
#######################
# To disable the beep also in less (i.e. also in man pages and when using "git diff") you need to add export LESS="$LESS -R -Q" in your ~/.profile file.

# disable bell 
    #you need to uncomment (or add if not already there) the line set bell-style none in your /etc/inputrc file.

# jsabino@sbin-g5:~$ sudo update-alternatives --config x-terminal-emulator 
# [sudo] password for jsabino: 
# There are 6 choices for the alternative x-terminal-emulator (providing /usr/bin/x-terminal-emulator).

#   Selection    Path                             Priority   Status
# ------------------------------------------------------------
# * 0            /usr/bin/terminator               50        auto mode
#   1            /usr/bin/gnome-terminal.wrapper   40        manual mode
#   2            /usr/bin/koi8rxterm               20        manual mode
#   3            /usr/bin/lxterm                   30        manual mode
#   4            /usr/bin/terminator               50        manual mode
#   5            /usr/bin/uxterm                   20        manual mode
#   6            /usr/bin/xterm                    20        manual mode

# Press <enter> to keep the current choice[*], or type selection number: 