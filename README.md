# esrally-docker
[![](https://dockerbuildbadges.quelltext.eu/status.svg?organization=ryanmaclean&repository=esrally)](https://hub.docker.com/r/ryanmaclean/esrally/builds/) 

An Elastic ES Rally Docker container image that allows you to run ESRally in moby and point it at a remote Elasticsearch host/cluster in order to run and re-run benchmarks. 

Based on the work found here: https://github.com/honestbee/docker-esrally but much less grandiose in scope, and more automated. 

# ES Rally in Docker

This docker container is expected to be used as a remote target benchmark. 

Warning: it will download a 250MB+ file and expand it to 3.30GB. It will ingest this data into the Elasticsearch cluster that you point it at. 

As the disclaimer will warn you: 

```
************************************************************************
************** WARNING: A dark dungeon lies ahead of you  **************
************************************************************************
```
## More Info About ES Rally

This project came about after watching the fantastic ES Rally intro video from Daniel Mitterdorfer: https://www.youtube.com/watch?v=HriBY2zoChw

The ES Rally docs can be found here: http://esrally.readthedocs.io/en/latest/

## Usage

There's are two ENV variables, one `ENDPOINT` var that defaults to `192.168.99.100:9200` for Kitematic use, but you can over-ride it as follows: 

```
docker run -it ryanmaclean/esrally:latest -e ENDPOINT="54.32.263.2:9200"
```

The other is `CREDENTIALS`, and is left blank, but may be needed when testing X-Pack-enabled clusters. That can be done as follows:

```
docker run -it ryanmaclean/esrally:latest -e CREDENTIALS=--client-options="basic_auth_user:'user',basic_auth_password:'password'"
```

This assumes that `54.32.263.2` is the primary endpoint of your cluster, and that you're using `9200` as the Elasticsearch port. 

## Usage with Elastic Cloud

Elastic Cloud has a remote server connection and security as well as certs enabled, so our string gets a bit long. 

For example:

```
docker run -it ryanmaclean/esrally:latest -e \
   CREDENTIALS=\
      --client-options=\
         use_ssl:true,\
         verify_certs:true,\
         basic_auth_user:'elastic',\
         basic_auth_password:'lkjsadioioasdlkjas822'
   ENDPOINT=\
      0983209823883892039265cd8046e4.us-west-1.aws.found.io:9243
```

## Sample Output

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

# Contributing

Contributions in the form of pull requests and issues are welcome! For example, version increments, upstream fixes and failing automated builds in Docker Hub all sound like future issues that might arise as the images are built everytime the Python image defined in `FROM` is updated. 
