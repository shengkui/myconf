#!/bin/bash

docker run -d -p 6379:6379 --restart=always --name redis redis:7.2.6 --requirepass "dev"
