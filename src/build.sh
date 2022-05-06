#!/bin/sh

. ~/localhost/repo/src/docker/php7.1/build.sh
. ~/localhost/repo/src/docker/php7.4/build.sh
. ~/localhost/repo/src/docker/php8.1/build.sh

# start servers
sh ~/localhost/repo/src/start.sh
