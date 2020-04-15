#!/bin/bash
#A simple bash script to run clant-tidy with all c files under current
#directory.
#It only works under bash v4+, for it uses a feature only supported by bash v4+.

#Get directory list
tmp=$(find . -type f -name '*.h' | sed -r 's#/[^/]+$##' | sort | uniq)

#Add -I to each directory
list=
for i in $tmp ;do
    list="$list -I $i"
done

#Run clang-tidy
clang-tidy **/*.c -- -Wall -Wextra -O2 $list
