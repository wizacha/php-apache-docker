FROM php:apache

COPY php.ini /usr/local/etc/php/
RUN a2enmod rewrite
COPY start /usr/local/bin/
CMD ["start"]
