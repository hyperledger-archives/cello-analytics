#!/bin/bash

if [ $# -lt 1 ]; then
    echo "usage:"
    echo "$0 ES_URL"
    exit 1
fi

ES_URL=$1

ES_INDEX="hyperledger_monitor"

INDEX_FILE=index_hyperledger_monitor.json

ES_INDEX=hyperledger_monitor

echo "Clean existing index"
curl -XDELETE ${ES_URL}/${ES_INDEX}

echo "Create new index"
curl -XPOST ${ES_URL}/${ES_INDEX} -d @$INDEX_FILE