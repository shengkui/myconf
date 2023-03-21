#!/bin/bash
#
# Push to all remote server
#

REMOTE_SERVER=$(git remote)
if [ $? -ne 0 ];then
    #Git command return error
    exit 1
fi

for url in $REMOTE_SERVER; do
    echo
    echo "---------------------------"
    echo "  Push to ${url} ..."
    echo "---------------------------"
    echo
    if git push -v "${url}" ;then
        echo; echo "[OK]"
    else
        echo; echo "[Error]"
    fi
done
