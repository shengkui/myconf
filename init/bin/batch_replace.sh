#!/bin/bash

if [ $# -lt 2 ] || [ $# -gt 3 ];then
    echo "A script to replace a string in all files under the directory"
    echo "$0 <directory> <original string> <new string>"
    exit 1
fi

TDIR="$1"
OLD_STR="$2"
NEW_STR="$3"

echo "replace \"${OLD_STR}\" with \"${NEW_STR}\" in files \"${TDIR}\""
#Replace a string in files under specified directory
find "${TDIR}" -type f -exec sed -i "s/${OLD_STR}/${NEW_STR}/g" {} \;
