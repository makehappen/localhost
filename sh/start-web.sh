#!/bin/sh

echo "launching web server container ..."

docker kill server_container &>/dev/null
docker rm server_container &>/dev/null

cd ~/

docker run \
--detach \
--name=server_container \
--publish 80:80 \
--volume=$PWD/localhost/www:/var/www \
--volume=$PWD/localhost/log/apache2:/var/log/apache2 \
--volume=$PWD/.ssh:/root/.ssh \
web-server
