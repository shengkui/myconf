#!/bin/bash

lst=$(docker ps -aq)
if [ ! -z "$lst" ];then
  docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $lst
fi
