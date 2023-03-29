#!/bin/bash
#===============================================================================
# FILENAME:
#     pack_repo.sh
#
# DESCRIPTION:
#     A script to pack directory of a git/svn repo without .git/, .gitignore
#     and .svn/
#
# REVISION(MM/DD/YYYY):
#     11/11/2015  Shengkui Leng (lengshengkui@outlook.com)
#     - Initial version
#===============================================================================
set -o nounset                              # Treat unset variables as an error

PNAME=$(basename "$0")

print_usage ()
{
    cat <<EOF
======================================================
     A script to pack directory of a git/svn repo
                       v1.0
======================================================

Usage:
    $PNAME <repo> <ver> [type]

Arguments:
    repo   - The name of repo(directory)
    ver    - The version of package
    type   - The package type: gzip(gz), bzip2(bz2), xz

Example:
    $PNAME test1 1.0

EOF

    exit 1
}

if [ $# -lt 2 ] ;then
    print_usage
fi

REPO="$1"
REV="$2"
TYPE=gzip
if [ $# -eq 3 ] ;then
    TYPE="$3"
elif [ $# -gt 3 ] ;then
    print_usage
fi

#Remove the trailing slash "/".
PACK="${REPO%/}"
#PACK="${REPO/\//}"
#PACK=`basename ${REPO}`

if [ ! -d "$PACK" ];then
    echo "The directory is NOT exist!"
    exit 1
fi

TAR_OPT=zcf
TAR_PACK=tmp.tgz

# Compare two version string
#
# Parameters:
#   $1 - 1st version string
#   $2 - 2nd version string
#
# Returns:
#   0 - $1 is less or equal to $2
#   1 - $1 is greater than $2
vercomp() {
    printf '%s\n%s' "$1" "$2" | sort -C -V
}

#Check the version of tar, if it's less than 1.30, don't use "--exclude-cvs-ignores" option.
TAR_VER=`tar --version | head -n 1 | awk '{print $NF}'`
if vercomp 1.30 $TAR_VER ;then
    #VERSION >= 1.30
    TAR_EXCLUDE=(--exclude-vcs --exclude='.drone.*' --exclude-backups --exclude-vcs-ignores)
else
    #VERSION < 1.30
    TAR_EXCLUDE=(--exclude-vcs --exclude='.drone.*' --exclude-backups --exclude='target' --exclude='.idea')
fi

if [ "$TYPE" == "gzip" ] || [ "$TYPE" == "gz" ];then
    TAR_OPT=zcf
    TAR_PACK="${PACK}_${REV}.tgz"
elif  [ "$TYPE" == "bzip2" ] || [ "$TYPE" == "bz2" ];then
    TAR_OPT=jcf
    TAR_PACK="${PACK}_${REV}.tbz"
elif  [ "$TYPE" == "xz" ];then
    TAR_OPT=Jcf
    TAR_PACK="${PACK}_${REV}.txz"
else
    echo "Unsupported package type"
    exit 1
fi

tar $TAR_OPT "$TAR_PACK" "${TAR_EXCLUDE[@]}" "$REPO"
exit $?
