#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

netstat -ant | awk '/^tcp/ {++S[$NF]} END {for(a in S) print (a,S[a])}'
