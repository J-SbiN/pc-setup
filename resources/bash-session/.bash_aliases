#!/bin/bash

# Listing
alias l="ls -lh"
alias ll="ls -alh"
alias lk="ls -halv --group-directories-first"
alias lm="ls -alv"

# Navigation
##############
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias lm="ls -alhvF --group-directories-first --color=auto"
alias ll="LC_ALL="C" ls -lhF --group-directories-first --color=auto"

function ld () { LC_ALL="C" ls -alhF --group-directories-first --color=always "${1:-.}" | grep -Ev '^-.*'; }
function lf () { LC_ALL="C" ls -alhF --group-directories-first --color=always "${1:-.}" | grep -Ev '^d.*'; }
function lk () {
    LC_ALL="C" ls -alhvF --group-directories-first "${1:-.}" \
        --ignore="[^\.]*" --ignore="." --ignore=".." \
        --color=always \
        | grep -Ev "^total [0-9]+[.,]?[0-9]*[a-Z]*$"
    LC_ALL="C" ls -lhvF --group-directories-first "${1:-.}" \
        --color=always \
        | grep -Ev "^total [0-9]+[.,]?[0-9]*[a-Z]*$"
}

function lll () {
    {
         printf "%s\0" . ..;
         cmd=(
            find "${1:-.}" -mindepth 1 -maxdepth 1 '('
                -name '.*' '('
                   -type d -printf "1 %p\0"
                ')' -o 
                    -printf "2 %p\0"
            ')' -o '('
                 '!' -name '.*' '('
                     -type d -printf "3 %p\0"
                ')' -o
                     -printf "4 %p\0" 
            ')'
         )
         "${cmd[@]}" |
         sort -z |
         cut -z -d' ' -f2-;
    } | xargs -0 ls -ald
}


# Docker
##########
#alias lsd="docker ps"
#alias lda="docker ps -a"
#alias ldl="docker ps -l"
#alias ldlq="docker ps -l -q"
#alias ldaq="docker ps -a -q"
#alias ldi="docker images"
#alias ldia="docker images -a"
#alias ldiaq="docker images -a -q"
#
#alias dstop="docker stop"
#alias drm="docker rm"
#alias drun="docker run"
#alias drmi="docker rmi"

#alias dbuild="docker build --force-rm --rm -t"
#alias dokit="docker run -it"
#alias dokd="docker run -d"

# Kubernetes
#############
alias kc="kubectl"
alias mk8="microk8s"
alias mkc="microk8s kubectl"

# GIT
########
alias gitl="git log --pretty=format:'%h - %p - %cn - %cr  : %s' --stat --graph"
alias gitlm="git log --author='Jorge Sabino' --pretty=format:'%h - %p - %cr  : %s' --stat --graph"

