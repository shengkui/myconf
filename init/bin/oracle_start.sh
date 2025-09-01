#!/bin/bash

docker run -d --restart=always -p 1521:1521 \
    -e ORACLE_SID=ORCLCDB -e ORACLE_PDB=ORCLPDB -e ORACLE_PWD=Ver7CompleXPW \
    -e ORACLE_EDITION=standard -e ORACLE_CHARACTERSET=AL32UTF8 \
    -v /mnt/storage/oracle:/opt/oracle/oradata --name oracle19c \
    registry.cn-hangzhou.aliyuncs.com/laowu/oracle:19c
