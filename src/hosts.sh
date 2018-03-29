#!/bin/sh

    clear

    echo "Your user password may be required to update /etc/hosts file..."
	cd ~/localhost/repo && git pull
	[ -e /etc/hosts.bkp ] && sudo rm /etc/hosts.bkp
	[ -e /etc/hosts ] && sudo mv /etc/hosts /etc/hosts.bkp
	[ -e /etc/hosts ] && sudo rm /etc/hosts
	sudo cp ~/localhost/hosts /etc/hosts
