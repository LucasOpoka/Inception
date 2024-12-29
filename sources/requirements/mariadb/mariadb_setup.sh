#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
	
	sleep 1

	mysqld --bootstrap --datadir=/var/lib/mysql --user=mysql << EOF 
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PWD';
CREATE DATABASE $MDB_NAME;
CREATE USER '$MDB_USER'@'%' IDENTIFIED by '$MDB_USER_PWD';
GRANT ALL PRIVILEGES ON $MDB_NAME.* TO '$MDB_USER'@'%';

FLUSH PRIVILEGES;
EOF

sleep 1

fi

mysqld_safe