# Log Collector and Query

## collector
Collect the log message of the containers on each worker node.

Basically, we setup a [logspout](https://github.com/gliderlabs/logspout) container on the worker node as the collector.

*Notice, on each worker node, need first install docker and use the default json log plugin for docker daemon.*

*Please remember to restart this collector if the logstash agent restarts.*

```sh
$ docker run \
	--rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	gliderlabs/logspout \
	syslog+udp://LOGSTASH_NODE:5000
```
