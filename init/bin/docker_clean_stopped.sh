#!/bin/bash

#Remove all stopped docker containers.
docker rm -f $(docker ps -f "status=exited" -q)

#Remove all created but not running docker containers.
docker rm -f $(docker ps -f "status=created" -q)
