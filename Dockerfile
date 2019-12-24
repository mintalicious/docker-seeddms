FROM php:7.4-apache
MAINTAINER Erik Schindler <erik@web4ward.de>

RUN apt-get update

RUN apt-get install -q -y libpng-dev imagemagick

RUN docker-php-ext-install gd

RUN apt-get install -q -y poppler-utils catdoc

ADD misc/seeddms-quickstart-5.1.13.tar.gz /var/www/

RUN a2enmod rewrite

COPY misc/php.ini /usr/local/etc/php/
COPY misc/000-default.conf /etc/apache2/sites-available/

COPY misc/settings.xml /var/www/seeddms51x/conf/settings.xml
RUN chown -R www-data:www-data /var/www/seeddms51x/

RUN touch /var/www/seeddms51x/conf/ENABLE_INSTALL_TOOL
