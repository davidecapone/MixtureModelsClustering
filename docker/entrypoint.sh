#!/bin/bash
set -e
echo "Container's IP address: `awk 'END{print $1}' /etc/hosts`"
if [ "$1" = 'server' ]; then
   jupyter lab --port=8081 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' --NotebookApp.allow_origin='*'
else
    exec "$@"
fi