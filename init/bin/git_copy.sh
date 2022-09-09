#!/bin/bash
#===============================================================================
# FILENAME:
#     git_copy.sh
#
# DESCRIPTION:
#     Copy all modified files in the git repostory to another directory.
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

if [ $# -ne 1 ];then
    echo "Usage: $(basename "$0") <Target directory>"
    exit 1
fi

# Target directory
TARGET=$1

echo "Copying all modified files to $TARGET"
#cp -pv --parents `git diff --name-only` "$TARGET"
for i in $(git diff --name-only) ;do
	# Create the target directory, if it doesn't exist.
	mkdir -p "$TARGET/$(dirname $i)"

	# Copy the file to target directory.
    echo ">>>> $i"
	cp -a "$i" "$TARGET/$i"
done

echo "Done."
