#!/bin/bash
#Update archlinux-keyring for Arch Linux system to fix the error of importing keys.
set -u

if [ $UID -ne 0 ];then
    echo "Please run this script with sudo!"
    exit 1
fi

pacman -S archlinux-keyring
pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys
