## Analytics Cluster Configuration

The analytics cluster will be setup as a data store, receiving system status data and the log data.

Basically, we need to setup a elk cluster with 1 master node and several slave nodes.

The master node will provide additional dashboard service.

*Notice, on each node, need first install docker and docker-compose. and also refer to some [configuration](https://github.com/hyperledger/cello/blob/master/docs/production_config.md)*

### ELK Master Node

The following command will start:

* logoxy: serve log query on port 8080, for more details refer to [logoxy](https://github.com/yeasy/logoxy)
* elasticsearch: receive api on port 9200, as logoxy's backend
* logstash: receive log msg on port 5000
* kibana: serve dashboard on port 5601

```sh
$ cd master
$ mkdir -p /opt/data/elasticsearch /opt/logstash/ /opt/es_config
$ cp logstash.conf /opt/logstash/
$ cp elasticsearch.yml /opt/es_config
$ docker-compose up
```


### ELK 2+ Slave Node

Setup elasticsearch instance, and join master node as one cluster.

The following command will start:

* elasticsearch: receive api on port 9200.

```sh
$ cd slave
$ mkdir -p /opt/data/elasticsearch /opt/es_config/
$ cp elasticsearch.yml /opt/es_config/
$ docker-compose up
```

### Check cluster state

Inspect each nodes state
```bash
curl -XGET http://MASTER_IP:9200/_cat/nodes?v
```

## Worker Node

Use logspout to [collect log msg](./logspout.md).

## License <a name="license"></a>
The Hyperledger Project uses the [Apache License Version 2.0](LICENSE) software license.