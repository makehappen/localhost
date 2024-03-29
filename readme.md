## Setup

### 1. Prerequisites
  * Docker
    - https://www.docker.com/docker-mac

  * Git
#####
    # Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    
    # Install git
    brew install git

  * SSH Key
#####  
    # create an ssh key of you don't have one already
    ssh-keygen
    eval "$(ssh-agent -s)"
    
  * add your ~/.ssh/id_rsa.pub key to your github account

### 2. Install
    # backup old localhost
    [ -d ~/localhost ] && mv ~/localhost ~/localhost-bkp
     
    # clone localhost repo
    mkdir ~/localhost && cd ~/localhost && git clone git@github.com:makehappen/localhost.git repo

    sh ~/localhost/repo/src/install.sh

Up and running: [http://localhost/](http://localhost/)

### 3. Add Websites

##### Use the following directory structure for your websites:
  
    ~/localhost/www/my-site
    - loads at http://my-site.localhost
    - from ~/localhost/www/my-site/public
    
    ~/localhost/www/my-site/www
    - loads at http://www.my-site.localhost
    - from ~/localhost/www/my-site/www/public
    
    ~/localhost/www/my-site/subdomain
    - loads at http://subdomain.my-site.localhost
    - from ~/localhost/www/my-site/subdomain/public
    
Add your websites to `~/localhost/hosts` file, mapped to `127.0.0.1`, and apply hosts file updates:
        
    sh ~/localhost/repo/src/hosts.sh

Example:

    127.0.0.1 www.topleveldomain.localhost

_NOTE: this will overwrite your /etc/hosts file after creating a backup.
If your /etc/hosts file contains websites you don't want to loose, copy your data before running the command above:_

	sudo cp /etc/hosts ~/localhost/hosts

## Useful Stuff

### Start / Stop / Restart / Update
    # start servers
    sh ~/localhost/repo/src/start.sh
    
    # stop servers
    sh ~/localhost/repo/src/stop.sh
    
    # restarts servers
    sh ~/localhost/repo/src/restart.sh
    
    # re-build local images
    sh ~/localhost/repo/src/build.sh

    # update all servers
    sh ~/localhost/repo/src/update.sh

### Apply changes after updating hosts file
    sh ~/localhost/repo/src/hosts.sh

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

  * Ubuntu 
  * PHP
  * Apache2
  * MySql 5.7
  * Redis (latest)
  * Composer
  * NodeJs

### Switch from one PHP version to another
    # create docker images (if not built already)
    sh ~/localhost/repo/src/build.sh
    
    # start servers (if not started)
    sh ~/localhost/repo/src/start.sh
    
    # Use PHP 7.1
    sh ~/localhost/repo/src/start-web.sh web-server-php7.1
    
    # Use PHP 7.4
    sh ~/localhost/repo/src/start-web.sh web-server-php7.4

    # Use PHP 8.1
    sh ~/localhost/repo/src/start-web.sh web-server-php8.1
    # temp fix: 1. ssh into docker container 2. run `service php8.1-fpm start`

### Missing a package?
    # 1. ssh in
    docker exec -i -t server_container /bin/bash
    
    # 2. add your package (may need `apt-get update` before intalling)

    # 3. add install command to Dockerfile with RUN and do a PR to be considered for the public repo
    
##### edit bash profile
    .bash_profile

##### add PATH
    export PATH=/usr/local/php5/bin:$PATH

### add helpful aliases to your ~/.bash_profile
    alias docker-start='sh ~/localhost/repo/src/start.sh'
    alias docker-stop='sh ~/localhost/repo/src/stop.sh'
    alias docker-update='sh ~/localhost/repo/src/update.sh'
    alias docker-sshin='docker exec -i -t server_container /bin/bash'
    alias docker-php7.1='sh ~/localhost/repo/src/start-web.sh web-server-php7.1'
    alias docker-php7.4='sh ~/localhost/repo/src/start-web.sh web-server-php7.4'
    alias docker-php8.1='sh ~/localhost/repo/src/start-web.sh web-server-php8.1'
