#!/bin/bash
#Install some software package for CentOS Linux system
set -u

INST="yum install"

SYSTEM="zsh expect tree curl openssl rpcbind net-snmp"
EDITOR="vim-enhanced vim-X11 cppcheck ctags global"
DEVELOP="gcc gcc-c++ golang automake autoconf libtool cmake gdb valgrind tcl"
LIBRARY="libxml2-devel pciutils-devel tcl-devel net-snmp-devel"
OTHER="git subversion tig python-markdown"

$INST $SYSTEM $DEVELOP $EDITOR $LIBRARY $OTHER
