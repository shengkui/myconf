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
    echo "-----------------------------------------"
    echo " updating $i ..."
    echo "-----------------------------------------"
    echo
    pushd . > /dev/null || continue
    cd "$i" || { echo "Enter dir $i error"; exit 1; }
    git pull 2>&1 || { echo "Update Git repo error"; exit 1; }
    if [ -f ".gitmodules" ];then
        git submodule update --init --recursive 2>&1 || \
            { echo "submodule update error"; exit 1; }
    fi
    popd > /dev/null || continue
done

echo
echo "done"
echo
exit 0
