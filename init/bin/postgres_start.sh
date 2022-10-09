#!/bin/bash

docker run --name postgresql -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=admin -p 5432:5432 -v /data:/var/lib/postgresql/data -d postgres:bullseye

