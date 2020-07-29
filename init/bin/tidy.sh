#!/bin/bash
#A simple bash script to run clant-tidy with all c/cpp files under current
#directory.
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

#Get directory list of header files
tmp=$(find . -type f -name '*.h' | sed -r 's#/[^/]+$##' | sort | uniq)

#Add -I to each directory
for i in $tmp ;do
    list+=("-I$i")
done

source_file=$(find . -type f \( -name \*.c -o -name \*.cpp \))

for f in $source_file ;do
    if [[ $f =~ \.cpp$ ]] ;then
        FLAGS=(-Wall -Wextra -Wno-unused-parameter -Wshadow -O2 -std=gnu++03)
    else
        FLAGS=(-Wall -Wextra -Wno-unused-parameter -Wshadow -O2 -std=gnu99)
    fi

    #Run clang-tidy
    clang-tidy -checks=misc-macro-parentheses "$f" -- "${FLAGS[@]}" "${list[@]}"
done
