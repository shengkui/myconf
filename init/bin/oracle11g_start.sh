#!/bin/bash

docker run -itd -p 1521:1521 --name oracle11g --restart=always \
      registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g
