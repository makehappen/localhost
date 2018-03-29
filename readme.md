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
    
    # update servers
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

  * Ubuntu 16.04
  * PHP 7.1 with common packages
  * Apache2
  * MySql (latest)
  * Redis (latest)
  * Composer
  * NodeJs
