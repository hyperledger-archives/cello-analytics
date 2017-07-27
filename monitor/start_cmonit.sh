#!/bin/bash
# This script will start a cmonit container for monitoring.
# It should be triggered at the upper directory

if [ $# -lt 1 ]; then
    echo "usage:"
    echo "$0 ES_URL"
    exit 1
fi

NET=cello_default
ES_URL=$1

echo "Will monitor the clusters..."

docker run -it --rm \
    --name cmonit \
    --net ${NET} \
    yeasy/cmonit \
    start --output-elasticsearch-url=${ES_URL}