#!/bin/bash

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Ver7CompleXPW" -p 1433:1433 \
    -v sqlvolume:/var/opt/mssql \
    --name mssql --restart=always -d mcr.microsoft.com/mssql/server:2019-latest
