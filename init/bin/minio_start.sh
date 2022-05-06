#!/bin/bash

docker run -d -p 9000:9000 -e "MINIO_ACCESS_KEY=minio" -e "MINIO_SECRET_KEY=minio123" \
    -v /tmp/leng/data:/data -v /tmp/leng/config:/root/.minio \
    minio/minio:RELEASE.2021-06-07T21-40-51Z server /data
