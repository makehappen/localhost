#!/bin/sh

# include mysql script
. ~/localhost/repo/src/start-mysql.sh

# include redis script
. ~/localhost/repo/src/start-redis.sh

# include web script
. ~/localhost/repo/src/start-web.sh
