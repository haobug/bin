#!/bin/bash
name="mysql1"
docker stop $name
docker rm $name
docker run --name=$name \
--detach \
--env MYSQL_ALLOW_EMPTY_PASSWORD=true \
--env MYSQL_ROOT_HOST=% \
-p 3306:3306 \
mysql/mysql-server:5.6
