#!/bin/bash

docker run -d -p 9000:9000 -p 9090:9090 --name minio --restart=always \
    -e "MINIO_ROOT_USER=minio" -e "MINIO_ROOT_PASSWORD=minio123" \
    -v /tmp/leng/data:/data -v /tmp/leng/config:/root/.minio \
    minio/minio server /data --console-address ":9090" -address ":9000"
