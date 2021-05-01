FROM after5/ubuntu16.04-apache-php7.1:latest
MAINTAINER Florin Ilie <florin@after5.io>

RUN docker-php-ext-install zip

# Copy virtual hosts
COPY hosts.conf /etc/apache2/sites-enabled/hosts.conf

