#!/bin/bash
#A simple bash script to run clant-tidy with all c/cpp files under current
#directory.
#We use find to build the list of include directories.

list=`find . -type d -exec bash -O dotglob -c '
    for dir do
        include=false
        found_files=false
        set -- "$dir"/*
        for f do
            [ -d "$f" ] && continue
            found_files=true
            case "${f##*/}" in
                *.h) include=true ;break ;;
                *) ;;
            esac
        done

        "$found_files" && "$include" && printf "%s\n" "-I $dir"
    done' bash {} +`
#echo $list

clang-tidy ./* -- -Wall -Wextra -O2 $list
