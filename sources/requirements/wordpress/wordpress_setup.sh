#!/bin/bash

if [ ! -f /var/www/wp/wp-config.php ]; then

    wp core download --path=/var/www/wp/ --allow-root

    wp config create    --allow-root \
                        --path=/var/www/wp/ \
                        --dbname=$MDB_NAME \
                        --dbuser=$MDB_USER \
                        --dbpass=$MDB_USER_PWD \
                        --dbhost=mariadb:3306

    wp core install     --allow-root \
                        --url=$WP_URL \
                        --title=$WP_TITLE \
                        --path=/var/www/wp/ \
                        --admin_user=$WP_ADMIN \
                        --admin_email=$WP_ADMIN_MAIL \
                        --admin_password=$WP_ADMIN_PWD
                        

    wp user create      --allow-root \
                        --path=/var/www/wp/ \
                        $WP_USER $WP_USER_MAIL \
                        --user_pass=$WP_USER_PWD

    chown -R www-data:www-data /var/www/wp

fi

mkdir -p /run/php/

php-fpm7.4 -F