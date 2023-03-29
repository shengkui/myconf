#!/bin/bash

#Remove all stopped docker containers.
#docker rm -f $(docker ps -f "status=exited" -q)
docker container prune -f

#Remove all created but not running docker containers.
created=$(docker ps -f "status=created" -q)
if [ ! -z "$created" ];then
    docker rm -f $created
fi
