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
    
    # re-build local image
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

    # Use PHP 7.1
    cd ~/localhost/repo && git checkout releases/php7.1 && sh ~/localhost/repo/src/update.sh

    # Use PHP 7.4
    cd ~/localhost/repo && git checkout releases/php7.4 && sh ~/localhost/repo/src/update.sh

### Missing a package?
    # 1. ssh in
    docker exec -i -t server_container /bin/bash
    
    # 2. add your package

    # 3. add install command to Dockerfile with RUN and do a PR to be considered for the public repo
    
### Upgrade local PHP        
        cd usr/local
        curl -s http://php-osx.liip.ch/install.sh | bash -s 7.3
        sudo rm /usr/local/php5
        sudo ln -s /usr/local/php5-7.3.8-20190811-205217 /usr/local/php5

##### edit bash profile
    .bash_profile

##### add PATH
    export PATH=/usr/local/php5/bin:$PATH

### add helpful aliases
    alias docker_start='sh ~/localhost/repo/src/start.sh'
    alias docker_stop='sh ~/localhost/repo/src/stop.sh'
    alias docker_update='sh ~/localhost/repo/src/update.sh'
    alias docker_sshin='docker exec -i -t server_container /bin/bash'
