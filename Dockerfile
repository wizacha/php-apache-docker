FROM php:apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

COPY php.ini /usr/local/etc/php/
COPY custom-security.conf /etc/apache2/conf-available/
RUN a2enconf custom-security
RUN a2enmod rewrite
COPY start /usr/local/bin/
CMD ["start"]
