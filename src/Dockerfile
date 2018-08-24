FROM speareducation/ubuntu16.04-apache-php7.1:latest
MAINTAINER Florin Ilie <florin@after5.io>

RUN apt-get update && apt-get install -y \
    && docker-php-ext-install bcmath

# Copy virtual hosts
COPY hosts.conf /etc/apache2/sites-enabled/hosts.conf
