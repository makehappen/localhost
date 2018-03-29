#!/bin/sh

# remove all other containers
docker rm -f $(docker ps -a -q) &>/dev/null

# remove non used images
docker rmi $(docker images -f dangling=true -q) &>/dev/null

# remove all images
docker rmi $(docker images -a -q) &>/dev/null

# force remove any left image
docker rmi --force $(docker images -a -q) &>/dev/null
