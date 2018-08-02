#!/bin/bash
#Change the onwner of the files

if [ $# -eq 0 ];then
    exit 0
fi
sudo chown -R shengkui.leng:shengkui.leng $*
