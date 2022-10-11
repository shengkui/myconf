#!/bin/bash

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Ver7CompleXPW" -p 1433:1433 \
    --name mssql -d mcr.microsoft.com/mssql/server:2019-latest
