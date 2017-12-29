#!/bin/sh

# include mysql script
. ~/localhost/repo/sh/start-mysql.sh

# include redis script
. ~/localhost/repo/sh/start-redis.sh

# include web script
. ~/localhost/repo/sh/start-web.sh
