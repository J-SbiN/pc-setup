#!/bin/bash

# TODO: turn the lists into an external file

# Installing Software
######################

## refreshing repos
sudo apt update 
sudo apt upgrade -y

# from aptitude repos
sudo apt install -y     \
    audacity            \
    barrier             \
    ca-certificates     \
    cowsay              \
    docker              \
    docker-compose      \
    fortunes            \
    gimp                \
    git                 \
    gitk                \
    google-chrome-stable    \
    kubernetes          \
    lutris              \
    nautilus            \
    notepadqq           \
    obs-studio          \
    steam-installer     \
    terminator          \
    unity-tweak-tool    \
    vim                 \
    vlc

# from snap-store
sudo snap install       \
    code                \
    rambox              \
    teams-for-linux     \
    zoom-client


# from third-party repos
    # dropbox
