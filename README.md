# esrally-docker
An Elastic ES Rally Docker container image that allows you to run ESRally in moby and point it at a remote Elasticsearch host/cluster in order to run and re-run benchmarks. 

Based on the work found here: https://github.com/honestbee/docker-esrally but much less grandiose in scope, and more automated. 

# ES Rally in Docker

This docker container is expected to be used as a remote target benchmark. 

Warning: it will download a 250MB+ file and expand it to 3.30GB. It will ingest this data into the Elasticsearch cluster that you point it it. 

As the disclaimer will warn you: 

```
************************************************************************
************** WARNING: A dark dungeon lies ahead of you  **************
************************************************************************
```

# Usage

There's one ENV variable that defaults to `192.168.99.100:9200` for Kitematic use, but you can over-ride it as follows: 

```
docker run -it ryanmaclean/esrally:latest -e ENDPOINT="54.32.263.2:9200"
```

This assumes that `54.32.263.2` is the primary endpoint of your cluster, and that you're using `9200` as the Elasticsearch port. 

# Sample Output

```
    ____        ____
   / __ \____ _/ / /_  __
  / /_/ / __ `/ / / / / /
 / _, _/ /_/ / / / /_/ /
/_/ |_|\__,_/_/_/\__, /
                /____/

INFO:rally.config:Upgrading configuration from version [6] to [8].
INFO:rally.config:Creating a backup of the current config file at [/root/.rally/rally.ini].
INFO:rally.config:Successfully self-upgraded configuration to version [8]
[INFO] Writing logs to /root/.rally/logs/rally_out_20170527T222757Z.log
Cloning into '/root/.rally/benchmarks/tracks/default'...
remote: Counting objects: 1057, done.
remote: Total 1057 (delta 0), reused 0 (delta 0), pack-reused 1057
Receiving objects: 100% (1057/1057), 755.53 KiB | 1.46 MiB/s, done.
Resolving deltas: 100% (799/799), done.
Checking connectivity... done.

************************************************************************
************** WARNING: A dark dungeon lies ahead of you  **************
************************************************************************

Rally does not have control over the configuration of the benchmarked
Elasticsearch cluster.

Be aware that results may be misleading due to problems with the setup.
Rally is also not able to gather lots of metrics at all (like CPU usage
of the benchmarked cluster) or may even produce misleading metrics (like
the index size).

************************************************************************
****** Use this pipeline only if you are aware of the tradeoffs.  ******
*************************** Watch your step! ***************************
************************************************************************

[INFO] Racing on track [geonames], challenge [append-no-conflicts] and car [external]

[INFO] Downloading data from [http://benchmarks.elasticsearch.org.s3.amazonaws.com/corpora/geonames/documents-2.json.bz2] (252 MB) to [/root/.rally/benchmarks/data/geonames/documents-2.json.bz2] ... [OK]
[INFO] Decompressing track data from [/root/.rally/benchmarks/data/geonames/documents-2.json.bz2] to [/root/.rally/benchmarks/data/geonames/documents-2.json] (resulting size: 3.30 GB) ... [OK]
[INFO] Preparing file offset table for [/root/.rally/benchmarks/data/geonames/documents-2.json] ... [OK]
```
