#!/bin/sh

clear

# copy install files
[ ! -f ~/localhost/hosts.conf ] && cp  ~/localhost/repo/src/hosts.conf ~/localhost/hosts.conf
[ ! -d ~/localhost/www ] && cp -R  ~/localhost/repo/www ~/localhost
[ ! -f ~/localhost/Dockerfile ] && cp ~/localhost/repo/src/Dockerfile ~/localhost
[ ! -f ~/localhost/hosts ] && cp ~/localhost/repo/src/hosts ~/localhost

# remove old image
docker kill server_container &>/dev/null
docker rm server_container &>/dev/null
docker rmi web-server &>/dev/null

# build image
cd ~/localhost
docker build -t web-server .

# start servers
sh ~/localhost/repo/src/start.sh
