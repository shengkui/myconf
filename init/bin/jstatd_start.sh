#!/bin/bash

#Try to get the directory of this script, and out config file is under the same directory.
script_file_path="$(readlink -f "${BASH_SOURCE}")"
script_dir=$(dirname "$script_file_path")

jstatd -J-Djava.security.policy=${script_dir}/jstatd.all.policy \
    -J-Djava.rmi.server.hostname=172.21.73.37 \
    -J-Djava.rmi.server.logCalls=false \
    -p 1231
