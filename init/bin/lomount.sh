#!/bin/bash
# Mount partitions within a disk image file

if [ $# -ne 3 ] ;then
    echo "Usage: `basename $0` <image file> <partition number(>0)> <mount point>"
    exit 1
fi

if [[ $(id -u) != 0 ]]; then
    echo "Mount a partition need root privilege!"
    exit 1
fi

if ! command -v fdisk &>/dev/null ;then
    echo "Can't find fdisk"
    exit 2
fi

FILE=$1     # Image file
PART=$2     # Partition number
DEST=$3     # Mount point

UNITS=$(fdisk -l $FILE 2>/dev/null | grep $FILE$PART | awk '{print $3}')
OFFSET=$((512 * UNITS))
mount -o loop,offset=$OFFSET "$FILE" "$DEST"
