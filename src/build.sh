#!/bin/sh

# build image
cd ~/localhost/repo/src
docker build -t web-server .
