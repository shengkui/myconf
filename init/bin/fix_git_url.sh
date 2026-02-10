#!/bin/bash
#===============================================================================
# FILENAME:
#     fix_git_url.sh
#
# DESCRIPTION:
#     Replace %20 in URL with '-' for all git repos under the directory.
#     From https://dev.azure.com/Advantech-EBO/AI%20Agent/_git/sql-lineage
#     to   https://dev.azure.com/Advantech-EBO/AI-Agent/_git/sql-lineage
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

# Set new url to git repo
#
# Parameters:
#     $1: repo directory
#     $2: parent directory (optional)
update_repo_url() {
    if [ $# -eq 1 ] ;then
        local dir="$1"
        local parent_dir="."
    elif [ $# -eq 2 ] ;then
        local dir="$1"
        local parent_dir="$2"
    else
        echo "invalid parameter"
        return 1
    fi

    echo
    echo "-----------------------------------------"
    echo "--    $parent_dir/$dir"
    echo "-----------------------------------------"
    echo
    cd "$dir" || { echo "Enter dir $dir error"; return 1; }

    sleep 0.5

    # 获取当前 Git 仓库的 origin 远程 URL
    GIT_URL=$(git config --get remote.origin.url)
    if [ -z "$GIT_URL" ]; then
        echo "Get url of repo error" >&2
        exit 1
    fi

    if [[ "$GIT_URL" == *"%20"* ]]; then
        # Replace %20 in URL with '-'.
        MODIFIED_URL="${GIT_URL//%20/-}"
        echo "new url: $MODIFIED_URL"
        git remote set-url origin "$MODIFIED_URL" 2>&1 || \
            { echo "Set new url error"; return 1; }
    else
        echo "No need to modify URL."
    fi

    if [ -f ".gitmodules" ];then
        echo "!!!NOTICE!!!: submodule found, please modify it yourself."
        return 1
    fi

    return 0
}

# Iterate all directories under current path.
for i in *; do
    #Skip non-directory
    if [[ ! -d "$i" ]];then
        continue
    fi

    #If it's a git repo directory, process it.
    if [[ -d "$i/.git" ]];then
        pushd . > /dev/null || continue
        update_repo_url "$i"
        popd > /dev/null || continue
        continue
    fi

    #Enter sub-directory
    pushd . > /dev/null || continue
    cd "$i" || { echo "enter dir $i error"; continue; }
    for j in *; do
        #If it's a git repo directory, process it.
        if [[ -d "$j" && -d "$j/.git" ]];then
            pushd . > /dev/null || continue
            update_repo_url "$j" "$i"
            popd > /dev/null || continue
        fi
    done
    popd > /dev/null || continue
done

exit 0
