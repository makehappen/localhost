FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install software-properties-common -y

COPY debconf.selections /tmp/
RUN debconf-set-selections /tmp/debconf.selections

# APACHE
RUN apt-get install apache2 libapache2-mod-wsgi python-dev -y

# PHP
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt update \
    && apt install php7.3 php7.3-cli php7.3-common -y

# PHP EXTENSIONS
RUN apt install -y \
    php-pear \
    php7.3-curl \
    php7.3-dev \
    php7.3-gd \
    php7.3-mbstring \
    php7.3-zip \
    php7.3-mysql \
    php7.3-xml \
    php7.3-fpm \
    libapache2-mod-php7.3 \
    php7.3-imagick \
    php7.3-recode \
    php7.3-tidy \
    php7.3-xmlrpc \
    php7.3-bcmath \
    php7.3-intl


# ZIP
RUN apt-get install zip unzip -y

RUN apt-get install -y --no-install-recommends \
    libfreetype6-dev

RUN apt-get install git nodejs nano tree vim curl mcrypt postfix sqlite3 -y

# Disable /javascript folder special handling
RUN apt-get remove javascript-common  -y

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

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN chmod +x /usr/sbin/run-lamp.sh
RUN chown -R www-data:www-data /var/www/html

VOLUME /var/www/html
VOLUME /var/log/httpd

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/run-lamp.sh"]

# Copy virtual hosts
COPY hosts.conf /etc/apache2/sites-enabled/hosts.conf
