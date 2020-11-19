#!/bin/sh

# drop current web-server image
docker rmi web-server-php7.4

# build image
cd ~/localhost/repo/src/docker/php7.4
docker build -t web-server-php7.4 .
