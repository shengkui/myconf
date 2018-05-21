#!/bin/bash
#Install some software package for Ubuntu Linux system
set -u

INST="apt install"

SYSTEM="zsh trash-cli expect tree curl openssl rpcbind snmpd"
EDITOR="vim vim-gui cppcheck shellcheck ctags global"
DEVELOP="gcc g++-multilib golang automake autoconf libtool cmake gdb valgrind tcl"
LIBRARY="libxml2-dev libpci-dev tcl-dev libsnmp-dev"
OTHER="git subversion tig markdown"

$INST $SYSTEM
$INST $DEVELOP
$INST $EDITOR
$INST $LIBRARY
$INST $OTHER
