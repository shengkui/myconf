#!/bin/bash

cd "${HOME}/repo/nussknacker-quickstart/" || exit 1
docker-compose -f docker-compose.yml -f docker-compose-env.yml -f docker-compose-custom.yml up -d
sleep 1
docker-compose -f docker-compose.yml -f docker-compose-env.yml -f docker-compose-custom.yml ps
