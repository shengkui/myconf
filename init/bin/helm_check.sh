#!/bin/bash

helm template . | kubectl apply --dry-run=client -f -
