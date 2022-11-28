#!/bin/bash
GITLAB_HOME=/srv/gitlab
IMAGE_NAME='gitlab/gitlab-ce'
CONTAINER_NAME='gitlab-ce'

docker run -d -p 80:80 -p 7443:443 -p 7022:22 \
    --restart always \
    -v ${GITLAB_HOME}/config:/etc/gitlab \
    -v ${GITLAB_HOME}/logs:/var/log/gitlab \
    -v ${GITLAB_HOME}/data:/var/opt/gitlab \
    --name ${CONTAINER_NAME} ${IMAGE_NAME}
