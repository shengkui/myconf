#!/bin/bash

docker run -d -p 6379:6379 --name redis redis:latest --requirepass "dev"