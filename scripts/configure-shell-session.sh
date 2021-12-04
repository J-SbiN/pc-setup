#!/bin/bash

 
# Set bash profile
#######################
# CURR_DIR="$(dirname $(readlink -s ${BASH_SOURCE[0]}))"
CURR_DIR="$(readlink -f $(dirname ${BASH_SOURCE[0]}))"
BASH_SESSION_DIR="${CURR_DIR}/../resources/bash-session"
PROFILE_FILE="${BASH_SESSION_DIR}/profile"
PROFILE_DESTINATION="${HOME}/.profile"
BASHRC_FILE="${BASH_SESSION_DIR}/bashrc"
BASHRC_DESTINATION="${HOME}/.bashrc"
ALIASES_FILE="${BASH_SESSION_DIR}/bash_aliases"
ALIASES_DESTINATION="${HOME}/.bash_aliases"
UTILS_DIR="${BASH_SESSION_DIR}/my-utils"
UTILS_DESTINATION="${HOME}/.my-utils"

BACKUP_LIST_NAME="BACKUP_LIST"

function _file_or_exits () {
    for file in $@ ; do
        if ! [ -f "${file}" ]; then
            echo -e "\e[31;01mERROR\e[0m: Could not find '${file}'."
	        echo "Aborted!"
	        exit 1
        fi
    done
}

function _warn_override () {
    echo -e "\e[33;01mWARNING\e[0m: The following files WILL GET OVERRIDDEN!"
    for file in $@ ; do
        if [ -f "${file}" ]; then
            echo -e "\t${file}"  
        fi
    done
    echo -n "OVERRIDE? [yes/Abort]   "
    read ANSWER1
    if ! [ $ANSWER1 == "yes" ]; then
        echo "Aborted!"
        exit 0
    fi
}

function _append_to_variable () {
    eval "${1}"+="'${@:2} '"
}

function _remove_list_in_variable () {
    for file in ${!1}; do
        rm "${file}"
    done
}

function _append_to_backup_list () {
    _append_to_variable "${BACKUP_LIST_NAME}" ${@}
}

function _remove_backup_files () {
    _remove_list_in_variable "${BACKUP_LIST_NAME}"
}


function _backup_files () {
    for file in $@ ; do
        local timetag="$(date +%Y%m%d.%H%M%S)"
        local backup="${file}_${timetag}.bak"
        if [ -f "${file}" ]; then
            mv "${file}" "${backup}"
            _append_to_backup_list "${backup}"
            echo "\e[36;01mDEBUG\e[00m: Backed up '${file}' --to--> '${backup}'"
        fi
    done
}

function _append_to_file () {
# TODO: Check source type and act accordingly
    local target="${1}"
    local source="${2}"
    echo -e -n "\e[96;01mINFO\e[00m: Appending '${source}' to '${target}' ...  "
    cat "${source}" >> "${target}"
    echo "Done."
}

# Checking the source files
_file_or_exits "${PROFILE_FILE}"        "${BASHRC_FILE}"        "${ALIASES_FILE}"

# Scare & unscare the user
_warn_override "${PROFILE_DESTINATION}" "${BASHRC_DESTINATION}" "${ALIASES_DESTINATION}" "${UTILS_DESTINATION}"
echo -en "\e[96;01mINFO\e[00m: Backing up existent files ... "
_backup_files "${PROFILE_DESTINATION}" "${BASHRC_DESTINATION}" "${ALIASES_DESTINATION}" "${UTILS_DESTINATION}"
echo "Done."

# Changin the files
_append_to_file "${PROFILE_DESTINATION}" "${PROFILE_FILE}"
_append_to_file "${BASHRC_DESTINATION}" "${BASHRC_FILE}"
_append_to_file "${ALIASES_DESTINATION}" "${ALIASES_FILE}"
cp -r "${UTILS_DIR}" "${UTILS_DESTINATION}"

# Cleaning up
# TODO: Identify if backup files exist
echo -e "The backup files keep the former version of the changed files."
echo -e "Keep backup files? [yes/No]"
read ANSWER2
if ! [ $ANSWER2 == "yes" ]; then
    _remove_backup_files
fi

# TODO: refactor to:
    # ask user: append files or override
    # manae separate flows




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
