FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
    && apt install -y php7.4-fpm php7.4-mysql wget mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY wordpress_setup.sh /bin/wordpress_setup.sh
RUN chmod +x /bin/wordpress_setup.sh

RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp


CMD ["wordpress_setup.sh"]

EXPOSE 9000