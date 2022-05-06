#!/bin/bash

#Remove all stopped docker containers.
docker rm -f $(docker ps -f "status=exited" -q)
