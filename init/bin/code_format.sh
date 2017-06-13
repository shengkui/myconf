#!/bin/bash
#==============================================================================
#Format C/C++ source file with indent and change CRLF to Unnix style.
#
#Usage:
#    code_format [-t] [files]
#        -t    - Use TAB for indent(default: space char used)
#        files - The C/C++ files to be formated
#Example:
#    code_format
#    code_format *.c
#    code_format -t
#    code_format -t *.c
#==============================================================================
# The switches/options used for indent utility:
#   -br   : Put braces on line with if, etc.
#   -brs  : Put braces on struct declaration line.
#   -bli0 : Indent braces 0 spaces.
#   -bad  : Force blank lines after the declarations.
#   -bap  : Force blank lines after procedure bodies.
#   -ce   : Cuddle else and preceeding `}´.
#   -ts4  : Set tab size to 4 spaces.
#   -nut  : Use spaces instead of tabs.
#   -nlp  : Do not line up parentheses.
#   -npsl : Put the type of a procedure on the same line as its name.
#   -l80  : Set maximum line length for non-comment lines to 80.
#   -kr   : Use K&R coding style.
#   -saf  : Put a space after each for.
#   -sai  : Put a space after each if.
#   -saw  : Put a space after each while.
#   -cpn  : Put comments to the right of #else and #endif statements in column n.
#==============================================================================
#Treat unset variables as an error
set -o nounset

#Use TAB or Space for indent: 1-TAB, 0-Space.
USE_TAB=0
INDET_OPTS="-cp1 -br -brs -bli0 -bap -ce -ts4 -nlp -npsl -l80 -kr -saf -sai -saw"
if [ $# -eq 0 ] ;then
    list=$(find . -name "*.[c|h]")
else
    #Is there a "-t"?
    if [ "$1" == "-t" ] ;then
        USE_TAB=1
        shift

        #Is there any other arguments?
        if [ $# -ge 1 ] ;then
            list=$*
        else
            list=$(find . -name "*.[c|h]")
        fi
    else
        list=$*
    fi
fi
if [ $USE_TAB -eq 0 ] ;then
    INDET_OPTS+=" -nut"
fi

for file in $list ;do
    echo "$file"
    dos2unix "$file" 2>/dev/null

    # Don't add idouble quotation marks to $INDET_OPTS, for indent will treat it
    # as one argument incorrectly!
    indent $INDET_OPTS "$file"
done

exit 0
