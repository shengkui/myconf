#!/bin/bash
#Install some software package for CentOS Linux system
set -u

INST="yum -y install"

SYSTEM="zsh expect tree curl openssl net-snmp zip unzip zlib openssh-server openssh-clients net-tools"
EDITOR="vim-enhanced vim-X11 cppcheck shellcheck ctags global"
DEVELOP="gcc gcc-c++ clang clang-analyzer clang-tools-extra golang make automake autoconf libtool cmake gdb valgrind tcl kernel-devel kernel-headers glibc glibc-devel glib2 libstdc++"
LIBRARY="libxml2-devel pciutils-devel tcl-devel net-snmp-devel openssl-devel ncurses-devel libtool-ltdl zlib-devel"
OTHER="git subversion tig python-markdown lynx p7zip indent ack"
X86LIB="glibc.i686 glibc-devel.i686 glib2.i686 libstdc++.i686"

$INST epel-release
$INST $SYSTEM $DEVELOP $EDITOR $LIBRARY $OTHER $X86LIB
