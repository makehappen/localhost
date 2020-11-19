#!/bin/sh

# drop current web-server image
docker rmi web-server-php7.1

# build image
cd ~/localhost/repo/src/docker/php7.1
docker build -t web-server-php7.1 .
