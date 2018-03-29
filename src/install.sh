#!/bin/sh

clear

# copy install files
[ ! -d ~/localhost/www ] && cp -R  ~/localhost/repo/www ~/localhost
[ ! -f ~/localhost/hosts ] && cp ~/localhost/repo/src/hosts ~/localhost

# remove cache
sh ~/localhost/repo/src/clear-cache.sh

# build image
sh ~/localhost/repo/src/build.sh

# start servers
sh ~/localhost/repo/src/restart.sh

