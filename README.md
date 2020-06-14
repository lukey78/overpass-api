# Overpass API docker image

## DEPRECATED IMAGE

This image is deprecated. Please use the much better one:

https://github.com/wiktorn/Overpass-API


## Note

This is based on [https://github.com/Frankkkkk/docker-overpass-api].

Main changes:

- use environment variables
- download the clone as recommended in the Wiki instead of the planet bz2 file
- run minutely updates without metadata and without area creation or other stuff


## What is it ?
Its actually a full install of the [overpass api server](http://overpass-api.de/). It supports:

* Database clone from the planet.osm files
* metadata support
* Minute updates
* API access over apache (http://URL/api/timestamp , http://URL/api/interpreter)

## How to run using standard Docker commands
You can simply build the Docker image by `docker build -t overpass_api .` and the run the docker 
container by `docker run -d --restart=always -v <PATH TO THE OVERPASS DB ON HOST>:/overpass_DB -p 80:80 overpass_api`.

Use the following environment variables to tweak container behaviour:

* CLONE_SERVER=https://dev.overpass-api.de/api_drolbr
* REPLICATE_SERVER=https://planet.osm.org/replication/minute
* VHOST_EMAIL=info@yourserver.com
* VHOST_FQDN=https://your-overpass.api.de


NOTE: After the server start up you have to wait several minutes (or hours depending on the planet size) 
until the DB is loaded. In order to check the status you can use `docker logs` command.


## How long will it take
The clone of the downloaded DEV server weighs about 120 GB.
After that, replication starts and your server becomes usable.

See the following Wiki page for details:

https://wiki.openstreetmap.org/w/index.php?title=Overpass_API/Installation

## More things to tweak
