Hyperledger Fabric Status Collection Scripts
====

Scripts to collect status (latency, cpu, mem, diskio, netio) of the hyperledger fabric clusters using [cmonit](https://github.com/yeasy/cmonit), and will store the collected results into elasticsearch.

It is recommended to run on the manager node.

## Setup

### Setup ElasticSearch
Run following command to create ES index.

```sh
$ bash setup_es.sh ES_NODE:9200
```

* setup_es.sh : Initially create ES index.
* index_hyperledger_monitor.json : ES index mapping template.

### Run
Start the cmonit container.

```sh
$ bash start_cmonit.sh ES_NODE:9200
```

### Visualization
On kibana dashboard, import the `kibana_export.json` file.

### Validation
Query the es index to see if the doc is there.

E.g.,

```sh
$ curl -X POST "ES_NODE:9200/hyperledger_monitor/cluster/_search?pretty=true" -d '{"query" : { "match":{ "cluster_id" : "574cf24a414b0502604cb3e5"  } } , "sort" : [ { "timestamp" : { "order":"desc" } } ] }'
$ curl -X POST "ES_NODE:9200/hyperledger_monitor/cluster/_search?pretty=true" -d '{"size" :1, "query" : { "match":{ "cluster_id" : "574cf24a414b0502604cb3e5"  } } , "sort" : [ { "timestamp" : { "order":"desc" } } ] }'
```