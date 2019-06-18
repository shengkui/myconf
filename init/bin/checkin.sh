#!/bin/bash
#===============================================================================
# FILENAME:
#     checkin.sh
#
# DESCRIPTION:
#     Check-in all modification push to remote server
#
# REVISION(MM/DD/YYYY):
#     04/20/2019  Shengkui Leng (lengshengkui@outlook.com)
#     - Initial version
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

print_usage ()
{
    cat <<EOF
=======================================================================
    A script to check-in all modification and push to remote server
                                v1.0
=======================================================================

Usage:
    $(basename "$0") <commit message> [file]

Example:
    $(basename "$0") "checkin modification for one file" t1.c
    $(basename "$0") "checkin all modification"

EOF

    exit 1
}

if [ $# -lt 1 ] ;then
    print_usage
fi
if [[ $1 == "-h" ]] ;then
    print_usage
fi
MSG="$1"

git status > /dev/null 2>&1
if [ $? -ne 0 ];then
    echo "This is not a git repo"
    exit 1
fi

echo "=========== Check-in change"
if [ $# -ge 2 ] ;then
    git add $2
else
    git add .   #all modification
fi
git commit -m "$MSG"

REMOTE_SERVER=$(git remote)

for url in $REMOTE_SERVER; do
    echo
    echo "=========== push to ${url}"
    if git push -v ${url} ;then
        echo; echo "[OK]"
    else
        echo; echo "[Error]"
    fi
done
