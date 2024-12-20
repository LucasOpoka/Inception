FROM debian:bullseye

ENV MDB_NAME=lucas_db
ENV MDB_USER=lucas
ENV MDB_USER_PWD=lucas1234
ENV MDB_ROOT_PWD=root1234

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y \
    && rm -rf /var/lib/apt/lists/*

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY mariadb_setup.sh /bin/mariadb_setup.sh

RUN chmod +x /bin/mariadb_setup.sh

CMD ["mariadb_setup.sh", "mysqld_safe"]

EXPOSE 3306