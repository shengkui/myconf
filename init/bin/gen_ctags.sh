#!/bin/sh

# generate tags for all c & c++ & ASM files
#find -name "*.[chCHS]" -o -name "*.[ch]pp" -o -name "*.cc" | ctags --fields=+iaS --extra=+q -L -
ctags -R --languages=c,c++,asm --fields=+iaS --extra=+q .
#--c++-kinds=+p 

