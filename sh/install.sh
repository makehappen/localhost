#!/bin/sh

clear

# copy install files
[ ! -f ~/localhost/hosts.conf ] && cp  ~/localhost/repo/sh/hosts.conf ~/localhost/hosts.conf
[ ! -d ~/localhost/www ] && cp -R  ~/localhost/repo/www ~/localhost
cp ~/localhost/repo/sh/Dockerfile ~/localhost

# remove old image
docker kill server_container &>/dev/null
docker rm server_container &>/dev/null
docker rmi web-server &>/dev/null

# build image
cd ~/localhost
docker build -t web-server .

# start servers
sh ~/localhost/repo/sh/start.sh
