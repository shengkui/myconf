#!/bin/bash
#===============================================================================
#
# FILENAME:
#     html2md.sh
#
# DESCRIPTION:
#     A script to convert all html files into markdown file by calling html2text.
#     It only supports 1-level sub-directory now.
#
# REVISION(MM/DD/YYYY):
#     02/28/2018  Shengkui Leng (lengshengkui@outlook.com)
#     - Initial version
#
#===============================================================================

#add "--" to support filename started with a char "-".
TOOL="html2text"
TOOL_OPT="--"

#-------------------------------------------------------------------------------
# NAME:
#     html_to_md
#
# DESCRIPTION:
#     Convert html file to markdown file
#
# PARAMETERS:
#     $1 - The html file
#
# RETURNS:
#     0 - OK
#     Others - Error
#-------------------------------------------------------------------------------
html_to_md()
{
    local rc=1

    if [ $# -ne 1 ];then
        return $rc
    fi
    local html_file=$1

    #Convert file
    local markdown_file="${html_file%.*}".md
    echo -n "\"${html_file}\"  ------->  \"${markdown_file}\" ...... "
    if ${TOOL} ${TOOL_OPT} "${html_file}" > "${markdown_file}" ;then
        echo "[OK]"
        rc=0
    else
        echo "[FAIL]"
    fi

    return $rc
}

if ! command -v $TOOL ;then
    echo "\"$TOOL\" not found, please install it before running this script"
    exit 1
fi


#If a directory specified, enter it and process files/directories in it.
if [ $# -eq 1 ];then
    cd "$1"|| { echo "Enter \"$1\" error"; exit 1; }
fi

for item in *; do
    #Process html file
    if [ -f "${item}" ]; then
        if [[ ${item} == *.html ]];then
            html_to_md "${item}"
        fi
        continue
    fi

    #Skip non-directory items
    if [ ! -d "${item}" ]; then
        continue
    fi

    #Enter sub-directory
    echo; echo "============= Directory: ${item} ============="
    pushd . > /dev/null || { echo "Save PWD error"; exit 1; }
    cd "${item}"|| { echo "Enter ${item} error"; exit 1; }

    #Process all html files under the directory
    for file in *.html ;do
        #Process file only
        if [ ! -f "${file}" ]; then
            continue
        fi
        html_to_md "${file}"
    done

    popd > /dev/null || { echo "Restore PWD error"; exit 1; }
done

echo
echo "done"
echo
exit 0
