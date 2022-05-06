# LOGIN TO docker.com
docker login
after5
# pass

# PUBLISH DOCKER IMAGE
cd ~/localhost/repo/src/docker/php8.1/ubuntu20.04-apache2-php8.1/
docker build -t ubuntu16.04-apache-php8.1 .
docker images

# tag the Image ID for "web-server"
docker tag [IMAGE-ID] after5/ubuntu20.04-apache2-php8.1:latest
docker push after5/ubuntu20.04-apache2-php8.1:latest
