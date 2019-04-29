#!/bin/sh
#Check-in all modification push to remote server

if [[ $# -ne 1 ]];then
    echo "Usage: $0 <commit message>"
    exit 1
fi
MSG="$1"

git status > /dev/null 2>&1
if [ $? -ne 0 ];then
    echo "This is not a git repo"
    exit 1
fi

echo "=========== Check-in change"
git add .
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
