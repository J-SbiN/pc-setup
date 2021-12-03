#!/bin/bash


## Listing
##############
alias l="ls -lh"
#alias ll='ls -alhF'
alias la='ls -A'
#alias lk="ls -halv --group-directories-first"
#alias lm="ls -alv"

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



## Third Party
###############

if [ -f ~/.my-utils/bash_thirdparty ]; then
    . ~/.my-utils/bash_thirdparty
fi