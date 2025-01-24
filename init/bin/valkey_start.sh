#!/bin/bash

docker run -d -p 6379:6379 --name valkey valkey/valkey:8 --requirepass "dev"
