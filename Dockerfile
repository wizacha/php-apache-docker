FROM php:apache

RUN docker-php-ext-install pdo_mysql
COPY php.ini /usr/local/etc/php/
COPY custom-security.conf /etc/apache2/conf-available/
RUN a2enconf custom-security
RUN a2enmod rewrite
COPY start /usr/local/bin/
CMD ["start"]
