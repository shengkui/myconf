#!/bin/bash

golangci-lint run --no-config --issues-exit-code=1 --timeout=10m --disable-all \
    --enable=deadcode --enable=gocyclo --enable=golint --enable=varcheck \
    --enable=structcheck --enable=maligned --enable=errcheck --enable=goconst \
    --enable=ineffassign --enable=interfacer --enable=unconvert --enable=dupl \
    --enable=megacheck --enable=gosec
