#!/bin/bash
#
# Update all git repositories via "git pull"
#

for i in *; do
    #Skip non-directory
    if [ ! -d "$i" ];then
        continue
    fi

    #If the directory is NOT a git repo, skip it.
    if [ ! -d "$i/.git" ];then
        continue
    fi

    echo
    echo ---------------------------
    echo " updating $i ..."
    echo ---------------------------
    echo
    pushd . > /dev/null
    cd "$i" || exit 1
    git pull || exit 1
    popd > /dev/null
done

echo
echo "done"
echo
exit 0
