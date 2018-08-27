#!/bin/bash

docker run --name "mysql-dev-db" \
  -v $(pwd)/mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD="root" \
  -e MYSQL_ROOT_HOST=% \
  -d mysql:8
