#!/bin/bash
#Install some software package for Arch Linux system
set -u

INST="pacman -S"

SYSTEM="zsh expect tree curl openssl rpcbind net-snmp zip unzip zlib openssh net-tools"
EDITOR="gvim vim-runtime cppcheck shellcheck ctags"
DEVELOP="gcc gcc-libs clang go make automake autoconf libtool cmake gdb valgrind tcl glibc glib2"
LIBRARY="libxml2 pciutils ncurses freetype2"
OTHER="git tig w3m p7zip discount the_silver_searcher python-html2text"
X86LIB="lib32-gcc-libs lib32-glibc"

$INST $SYSTEM $DEVELOP $EDITOR $LIBRARY $OTHER $X86LIB
