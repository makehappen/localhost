FROM ubuntu:20.04

RUN apt-get update
#RUN apt-get upgrade -y

# APACHE
RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2 libapache2-mod-wsgi python-dev -y

# UTILS
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends libfreetype6-dev apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install software-properties-common -y

COPY debconf.selections /tmp/
RUN DEBIAN_FRONTEND=noninteractive debconf-set-selections /tmp/debconf.selections

# PHP
RUN DEBIAN_FRONTEND=noninteractive apt-get install php -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install php-cli php-common -y

# PHP extensions
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    php-pear \
    php-curl \
    php-dev \
    php-gd \
    php-mbstring \
    php-zip \
    php-mysql \
    php-xml \
    php-fpm \
    libapache2-mod-php \
    php-imagick \
    php-tidy \
    php-xmlrpc \
    php-bcmath \
    php-intl

# mysql client
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-client

# ZIP
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y zip unzip

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git nano tree vim curl mcrypt postfix sqlite3

# composer
RUN DEBIAN_FRONTEND=noninteractive curl -s https://getcomposer.org/installer | php
RUN DEBIAN_FRONTEND=noninteractive mv composer.phar /usr/local/bin/composer

# Disable /javascript folder special handling
RUN DEBIAN_FRONTEND=noninteractive apt-get remove -y javascript-common

ENV LOG_STDOUT **Boolean**
ENV LOG_STDERR **Boolean**
ENV LOG_LEVEL warn
ENV ALLOW_OVERRIDE All
ENV DATE_TIMEZONE UTC
ENV TERM dumb

COPY index.html /var/www/html
COPY run-lamp.sh /usr/sbin/

RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod vhost_alias

RUN chmod +x /usr/sbin/run-lamp.sh
RUN chown -R www-data:www-data /var/www/html

VOLUME /var/www/html
VOLUME /var/log/httpd

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/run-lamp.sh"]

# Copy virtual hosts
COPY ../../hosts.conf /etc/apache2/sites-enabled/hosts.conf
