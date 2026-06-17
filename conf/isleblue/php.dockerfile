FROM php:8.4-fpm-alpine

ARG user
ARG uid

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g ${uid} laravel && adduser -G ${user} -g ${user} -s /bin/sh -D ${user}

RUN mkdir -p /var/www/html

RUN docker-php-ext-install pdo pdo_mysql exif

RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del pcre-dev ${PHPIZE_DEPS}

RUN apk --no-cache add \
        libzip-dev \
        zip \
        freetype-dev \
        libwebp-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        librsvg \
  && docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype \
  && docker-php-ext-install zip gd

#RUN apk --no-cache add libbz2-dev
#RUN docker-php-ext-install bz2

RUN apk add --no-cache \
    imagemagick \
    imagemagick-dev \
    libtool \
    autoconf \
    g++ \
    make \
    pkgconf \
    pcre-dev

RUN pecl install imagick \
    && docker-php-ext-enable imagick

RUN apk del imagemagick-dev libtool autoconf g++ make pkgconf pcre-dev

COPY php/php.ini /usr/local/etc/php/conf.d/php.ini

RUN chown laravel:laravel /var/www/html
