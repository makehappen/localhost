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
    sh ~/localhost/repo/sh/install.sh

Localhost is now up and running: [http://localhost/](http://localhost/)

### 3. Add Hosts
    # 1. Update ~/localhost/hosts.conf
    
    # 2. Restart
    sh ~/localhost/repo/sh/restart.sh

## Useful Stuff

#### Start / Stop / Restart
    sh ~/localhost/repo/sh/start.sh
    sh ~/localhost/repo/sh/stop.sh
    sh ~/localhost/repo/sh/restart.sh

#### DB Server
  * Container host: mysql_container (apps access)
  * Local machine host: 0.0.0.0 (manual access)
  * User: root
  * Password: mypassword
  * Port: 6603
  * Files: ~/localhost/lib/mysql

#### Redis Server
  * Container host: redis_container (apps access)
  * Local machine host: 0.0.0.0 (manual access)
  * Port: 6379

#### Web Server
    # SSH into web server
    docker exec -i -t server_container /bin/bash

    # Exit web server
    exit
    
  * Logs: ~/localhost/log/apache2
    
#### Included

  * Ubuntu 16.04
  * PHP 7.0 with common packages
  * Apache2
  * MySql (latest)
  * Redis (latest)
  * Composer
  * NodeJs
  * Postfix
    
    
