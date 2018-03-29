#!/bin/sh

clear

# update repo
cd  ~/localhost/repo/
git pull

# start servers
sh ~/localhost/repo/src/install.sh
