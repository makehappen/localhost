#!/bin/sh

echo "launching redis container ..."

docker kill redis_container &>/dev/null
docker rm redis_container &>/dev/null

docker run \
--detach \
--name=redis_container \
--publish 6379:6379 \
redis
