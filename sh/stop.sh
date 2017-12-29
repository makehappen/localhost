#!/bin/sh

echo "stopping servers ..."

docker kill server_container &>/dev/null
docker rm server_container &>/dev/null

docker kill mysql_container &>/dev/null
docker rm mysql_container &>/dev/null

docker kill redis_container &>/dev/null
docker rm redis_container &>/dev/null

echo "servers stopped"