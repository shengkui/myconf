#!/bin/bash
#===============================================================================
# FILENAME:
#     git_copy.sh
#
# DESCRIPTION:
#     Copy all modified or new files in the git repostory to another directory.
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

if [ $# -ne 1 ];then
    echo "Usage: $(basename "$0") <Target Directory>"
    exit 1
fi

# Target directory
TARGET=$1

echo "Copying all modified or new files to $TARGET"
#cp -pv --parents `git diff --name-only` "$TARGET"
#git diff --name-only
for i in $(git status --porcelain | awk '{ print $2 }') ;do
	# Create the target directory, if it doesn't exist.
	mkdir -p "$TARGET/$(dirname $i)"

	# Copy the file to target directory.
    echo ">>>> $i"
	cp -a "$i" "$TARGET/$i"
done

echo "Done."
