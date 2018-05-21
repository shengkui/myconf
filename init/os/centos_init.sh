#!/bin/bash
#Install some software package for CentOS Linux system
set -u

INST="yum -y install"

SYSTEM="zsh expect tree curl openssl rpcbind net-snmp zip unzip zlib unzip
openssh-server net-tools"
EDITOR="vim-enhanced vim-X11 cppcheck ctags global"
DEVELOP="gcc gcc-c++ golang make automake autoconf libtool cmake gdb valgrind
tcl kernel-devel kernel-headers glibc glibc-devel glib2 libstdc++"
LIBRARY="libxml2-devel pciutils-devel tcl-devel net-snmp-devel openssl-devel
ncurses-devel libtool-ltdl zlib-devel"
OTHER="git subversion tig python-markdown"

$INST $SYSTEM $DEVELOP $EDITOR $LIBRARY $OTHER
