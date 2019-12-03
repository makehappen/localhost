#!/bin/sh

# drop current web-server image
docker kill server_container &>/dev/null
docker rm server_container &>/dev/null
docker rmi web-server

# build image
cd ~/localhost/repo/src/docker
docker build -t web-server .

# start servers
sh ~/localhost/repo/src/restart.sh

