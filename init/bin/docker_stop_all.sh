#!/bin/bash

lst=$(docker ps -q)
if [ ! -z "$lst" ];then
    #stop all running container
    docker stop $lst
fi
