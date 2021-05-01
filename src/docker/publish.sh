# LOGIN TO docker.com
docker login
after5
# pass

# PUBLISH DOCKER IMAGE
cd ~/localhost/repo/src/docker/php7.4/ubuntu20.04-apache2-php7.4/
docker build -t ubuntu16.04-apache-php7.4 .
docker images

# tag the Image ID for "web-server"
docker tag [IMAGE-ID] after5/ubuntu20.04-apache2-php7.4:latest
docker push after5/ubuntu20.04-apache2-php7.4:latest
