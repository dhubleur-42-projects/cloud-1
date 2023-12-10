FROM debian:buster

RUN apt-get update
RUN apt-get install php php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y
RUN apt-get install curl -y

COPY ./php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress
RUN mkdir -p /run/php

COPY ./init.sh /var/wordpress/init.sh

WORKDIR /var/www/html/wordpress

ENTRYPOINT ["sh", "/var/wordpress/init.sh"] 