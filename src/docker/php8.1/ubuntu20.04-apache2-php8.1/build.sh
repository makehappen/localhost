#!/bin/sh

# drop current web-server image
docker rmi web-server-php8.1

# build image
cd ~/localhost/repo/src/docker/php8.1/ubuntu20.04-apache2-php8.1
docker build -t web-server-php8.1 .
