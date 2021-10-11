#!/bin/bash

# To learn about the fields:
# run `man fstab`
# or visit  https://man7.org/linux/man-pages/man5/fstab.5.html,
#           https://wiki.debian.org/fstab
#       or  https://help.ubuntu.com/community/Fstab

# TODO 2.2: automate variable import
FS_DEVICE=${1}
FS_UUID="$(blkid | grep "${DEVICE}" | sed -r 's#.* UUID="([0-9a-Z_-]*)".*#\1#g')" 
FS_MOUNT_PT=""
FS_TYPE=""
FS_OPTS=""
FS_DUMP=""
FS_PASS=""
FS_FIX_COLOR=""

#   /---> The unique identifier of the drive (run `sudo blkid` to get it)
#   |                     /---> The path where you want the drive to become available at
#   |                     |                 /---> the type of the drive format (see more at https://en.wikipedia.org/wiki/Comparison_of_file_systems)
#   |                     |                 |            /---> Options!... indeed... read the manual
#   |                     |                 |            |              /---> weather "dump" (if you have it installed) shoud backup the drive (1) or not (0)
#   |                     |                 |            |              |       /--->  if fsck should check the disk on boot first (1) not first (2) or not at all (0)
#   |                     |                 |            |              |       |
# <file system>         <mount point>       <type>      <options>       <dump>  <pass>

# TODO 2.1: add loop for several partitions/mount-points
# TODO 1: check if an entry already exists for the partition
sudo echo "UUID=${FS_UUID}      /media/storage      ntfs-3g     permissions     0       0" >> /etc/fstab


# fix the freaking color for ntfs  ->   blue on gree bkground  becomes  the regular directory color - bold blue
sudo sed -i 's/OTHER_WRITABLE 34;42/OTHER_WRITABLE 01;34/g' /usr/bin/dircolors
