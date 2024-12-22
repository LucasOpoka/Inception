FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
    && apt install -y gettext nginx openssl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/nginx_crt.crt \
    -keyout /etc/nginx/ssl/nginx_key.key \
    -subj "/C=FI/ST=UUSIMA/L=HELSINKI/O=HIVE/OU=HIVE/CN=lopoka.42.fr"

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx"]

EXPOSE 443