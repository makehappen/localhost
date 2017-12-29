#!/bin/sh

echo "launching db container ..."

docker kill mysql_container &>/dev/null
docker rm mysql_container &>/dev/null

cd ~/

docker run \
--detach \
--name=mysql_container \
--env="MYSQL_ROOT_PASSWORD=mypassword" \
--publish 6603:3306 \
--volume=$PWD/localhost/lib/mysql/:/var/lib/mysql \
mysql --sql-mode=""
