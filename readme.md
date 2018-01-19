## Setup

### 1. Preparation
  * install docker (if not installed already)
    - https://www.docker.com/docker-mac
###
    # install xcode (if not installed already)
    xcode-select --install &>/dev/null
     
    # backup old localhost
    [ -d ~/localhost ] && mv ~/localhost ~/localhost-bkp
     
    # clone localhost repo
    mkdir ~/localhost && cd ~/localhost && git clone git@github.com:makehappen/localhost.git repo

### 2. Install
    sh ~/localhost/repo/src/install.sh

Localhost is now up and running: [http://localhost/](http://localhost/)

### 3. Add Hosts
  * Update hosts file: ~/localhost/hosts.conf
####
    # Apply changes
    sh ~/localhost/repo/src/restart.sh

## Useful Stuff

### Start / Stop / Restart
    sh ~/localhost/repo/src/start.sh
    sh ~/localhost/repo/src/stop.sh
    sh ~/localhost/repo/src/restart.sh

### Database
##### Accessed by apps from docker container
  * Host: mysql_container
  * Port: 3306
  
##### Accessed from local machine (command line or via Sequel Pro)
  * Host: 0.0.0.0
  * Port: 6603
  
##### All access type  
  * User: root
  * Password: mypassword
  * DB Files: ~/localhost/lib/mysql

### Redis
##### Accessed by apps from docker container
  * Host: redis_container
  
##### Accessed from local machine (command line)
  * Host: 0.0.0.0

##### All access type
  * Port: 6379

### Web
    # SSH into web server
    docker exec -i -t server_container /bin/bash

    # Exit web server
    exit
    
  * Websites folder: ~/localhost/www
    * web server /var/www folder mounts it
  * Logs: ~/localhost/log/apache2
    
### Included

  * Ubuntu 16.04
  * PHP 7.0 with common packages
  * Apache2
  * MySql (latest)
  * Redis (latest)
  * Composer
  * NodeJs
  * Postfix
    
    
