#!/bin/bash

service mariadb start

mariadb -u root << EOF
CREATE DATABASE IF NOT EXISTS $MDB_NAME;
CREATE USER IF NOT EXISTS '$MDB_USER'@'%' IDENTIFIED BY '$MDB_USER_PWD';
GRANT ALL PRIVILEGES ON $MDB_NAME.* TO '$MDB_USER'@'%' IDENTIFIED BY '$MDB_USER_PWD';
GRANT ALL PRIVILEGES ON $MDB_NAME.* TO 'root'@'%' IDENTIFIED BY '$MDB_ROOT_PWD';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MDB_ROOT_PWD');
EOF

service mariadb stop

exec $@