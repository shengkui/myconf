#!/bin/bash
#A simple bash script to run clant-tidy with all c/cpp files under current
#directory.

#Get directory list
tmp=`find . -type f -name '*.h' | sed -r 's#/[^/]+$##' | sort | uniq`

#Add -I to each directory
list=
for i in $tmp ;do
    list="$list -I $i"
done

#Run clang-tidy
clang-tidy ./* -- -Wall -Wextra -O2 $list
