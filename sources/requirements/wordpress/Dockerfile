FROM alpine:3.19.2

RUN apk update && apk add bash wget php82 php82-fpm php82-phar php82-curl php82-cgi php82-mysqli php82-iconv mariadb-client

COPY www.conf /etc/php82/php-fpm.d/www.conf
COPY wordpress_setup.sh /bin/wordpress_setup.sh
RUN chmod +x /bin/wordpress_setup.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wp
RUN adduser -D -H -s /sbin/nologin -g www-data -G www-data www-data

CMD ["wordpress_setup.sh"]

EXPOSE 9000
