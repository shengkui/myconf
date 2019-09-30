#!/bin/bash
#Install some software package for Ubuntu Linux system
set -u

INST="apt install"

SYSTEM="zsh trash-cli expect tree curl openssl snmpd zip unzip openssh-server net-tools"
EDITOR="vim vim-gui-common cppcheck shellcheck ctags global"
DEVELOP="gcc g++-multilib clang clang-tools golang automake autoconf libtool cmake gdb valgrind tcl"
LIBRARY="libxml2-dev libpci-dev tcl-dev libsnmp-dev libelf-dev"
OTHER="git subversion tig markdown lynx p7zip indent"

$INST $SYSTEM $DEVELOP $EDITOR $LIBRARY $OTHER
