#!/bin/bash

docker run --name postgresql -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Ver7CompleXPW -p 5432:5432 \
    --restart=always -v /mnt/storage/pg:/var/lib/postgresql/data -d postgres:16

