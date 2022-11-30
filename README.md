# Docker with Telegraf influxDB Grafana 
[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)
[![Docker Pulls](https://img.shields.io/docker/pulls/appwrite/telegraf?color=f02e65&style=flat-square)](https://hub.docker.com/r/appwrite/telegraf)
[![Build Status](https://img.shields.io/travis/com/appwrite/docker-telegraf?style=flat-square)](https://travis-ci.com/appwrite/docker-telegraf)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite)
[![Follow Appwrite on StackShare](https://img.shields.io/badge/follow%20on-stackshare-blue?style=flat-square)](https://stackshare.io/appwrite)
![Tux, the Linux mascot](https://user-images.githubusercontent.com/64506580/159311466-f720a877-6c76-403a-904d-134addbd6a86.png)

Within this project we will make use of docker-compose which will help us to orchestrate all the necessary images.

We will use the official Docker images for 
* [Grafana](https://hub.docker.com/r/grafana/grafana "Grafana").
* [telegraf](https://hub.docker.com/_/telegraf "Grafana").
* [influxdb](https://hub.docker.com/_/influxdb "Grafana").
## Getting Started

These instructions will cover usage information.

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Configuration files

## telegraf.conf

In this file where the connection to a database is configured and what data will be sent to the database.

```shell
[[inputs.exec]]
commands=[“iperf3 -c 192.168.0.59 –json”]
interval = “2m”
timeout = “240s”
data_format = “json”
json_query = “end”
name_override = “IMSI=”

##############################################################################
# OUTPUT PLUGINS #
###############################################################################
# Configuration for sending metrics to InfluxDB
[[outputs.influxdb]]
 ## The full HTTP or UDP URL for your InfluxDB instance.
  urls = [“http://127.0.0.1:8086”]

 ## The target database for metrics; will be created as needed.
 ## For UDP url endpoint database needs to be configured on server side.
  database = “iperf”

 ## HTTP Basic Auth
  username = “<username>”
  password = “password” 
```


### Usage
execute
```shell
 git clone git@github.com:Jorge-DevOps/Docker-con-Telegraf-InfluxDB-Grafana.git with git Bash
```
Here you will find several files necessary for the deployment of the project, the file that interests us in this section is docker-compose.yaml.
This file contains the confdigurations of the official Docker images.
```shell
cd Docker-con-Telegraf-InfluxDB-Grafana
```
To download the images and execute the containers we can do it in different ways, in my case I will use docker-compse.
```shell

docker-compose up -d
```

### Environment Variables


### Build / Release

```
docker build --tag appwrite/telegraf:1.2.0 .
docker push appwrite/telegraf:1.2.0
```

Multi-arch build (experimental using [buildx](https://github.com/docker/buildx)):

```
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 --tag appwrite/telegraf:1.2.0 --push .
```

## Find Us

* [GitHub](https://github.com/appwrite)
* [Discord](https://appwrite.io/discord)
* [Twitter](https://twitter.com/appwrite)

## Copyright and license

The MIT License (MIT) [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)
