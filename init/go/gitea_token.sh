#!/bin/bash

NETRC_FILE="${HOME}/.netrc"
if [ -f "$NETRC_FILE" ]; then
    exit 0
fi
echo "Creating .netrc ... "

#Ask for username and password
echo -n "Please input username: "
read -r user
echo -n "Please input password: "
read -rs pass   #No echo

GITEA_SERVER="repos.my.to"

#Create Token
token=$(curl -s -u "$user:$pass" -X POST \
    "http://${GITEA_SERVER}/api/v1/users/${user}/tokens" \
    -H "accept: application/json" -H "Content-Type: application/json" \
    -d "{ \"name\": \"go_mod_token\"}" | jq .sha1)
#Cut the double quote
token=${token:1:-1}

echo "machine ${GITEA_SERVER} login ${user} password ${token}" > "${NETRC_FILE}"
