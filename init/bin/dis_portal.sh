#!/bin/bash

docker run -d --rm --name=dis-portal -p 3000:80 \
   -e SSO_API_URL=http://api-sso-ensaas.labs.wise-paas.com.cn \
   -e DIS_API_URL=http://172.21.92.209:8000 \
   -e SHOW_BI_MENU=false \
   appfactory.arfa.wise-paas.com/datainsight/dis-portal:2.0.0.2

