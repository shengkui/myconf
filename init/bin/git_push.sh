#!/bin/bash
#
# Push to all remote server
#

REMOTE_SERVER=$(git remote)

for url in $REMOTE_SERVER; do
    echo
    echo "---------------------------"
    echo "  Push to ${url} ..."
    echo "---------------------------"
    echo
    if git push -v ${url} ;then
        echo; echo "[OK]"
    else
        echo; echo "[Error]"
    fi
done
