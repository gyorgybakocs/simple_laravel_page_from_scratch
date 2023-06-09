FROM php:8.0-fpm-alpine3.13 AS php-fpm-base

ENV PHP_EXTRA_CONFIGURE_ARGS  --enable-pcntl

WORKDIR /var/www/html

RUN apk update

RUN apk add freetype-dev
RUN apk add libjpeg-turbo-dev
RUN apk add libpng-dev
RUN apk add libzip-dev
RUN apk add zlib-dev
RUN apk add ghostscript
RUN apk add busybox-extras
RUN apk add vim
RUN apk add curl
RUN apk add zip
RUN apk add unzip
RUN apk add libxml2 libxslt-dev
RUN apk add jpeg-dev libpng-dev

RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-configure zip
RUN docker-php-ext-install pdo pdo_mysql sockets gd zip soap

RUN apk add --no-cache --update linux-headers $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer