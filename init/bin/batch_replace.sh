#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

PNAME=$(basename "$0")

if [ $# -lt 2 ] || [ $# -gt 3 ];then
    echo "A script to replace a string in all files under the directory"
    echo "$PNAME <directory> <original string> <new string>"
    exit 1
fi

TDIR="$1"
OLD_STR="$2"
NEW_STR="$3"

# Dynamically select delimiter based on OLD_STR and NEW_STR content
for delim in "/" "|" "#" "%" "@"; do
    if [[ "${OLD_STR//"$delim"/}" == "$OLD_STR" ]] && \
       [[ "${NEW_STR//"$delim"/}" == "$NEW_STR" ]]; then
        break
    fi
done

echo "replace \"${OLD_STR}\" with \"${NEW_STR}\" in files \"${TDIR}\" (using delimiter: $delim)"
#Replace a string in files under specified directory
find "${TDIR}" -type f -exec sed -i "s${delim}${OLD_STR}${delim}${NEW_STR}${delim}g" {} \;
