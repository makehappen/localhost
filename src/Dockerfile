FROM after5/ubuntu16.04-apache-php7.1:latest
MAINTAINER Florin Ilie <florin@after5.io>

RUN apt-get update && apt-get install -y \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable opcache

# Copy virtual hosts
COPY hosts.conf /etc/apache2/sites-enabled/hosts.conf

