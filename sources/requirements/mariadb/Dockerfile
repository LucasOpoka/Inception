FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y \
    && rm -rf /var/lib/apt/lists/*

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY mariadb_setup.sh /bin/mariadb_setup.sh
RUN chmod +x /bin/mariadb_setup.sh

CMD ["mariadb_setup.sh", "mysqld_safe"]

EXPOSE 3306