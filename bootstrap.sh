#!/usr/bin/env bash

Update () {
    echo "-- Update packages --"
    sudo apt-get update
    sudo apt-get upgrade
}
Update
sudo add-apt-repository ppa:ondrej/php
sudo apt-get install php7.1
sudo apt-get install php-xdebug
Update
sudo apt-get install php7.1-mysql libapache2-mod-php7.1
sudo a2dismod php5
sudo a2enmod php
echo "zend_extension=xdebug.so" >> /etc/php/apache2/conf.d/20-xdebug.ini &&\
echo "xdebug.remote_enable=1" >> /etc/php/apache2/conf.d/20-xdebug.ini &&\
echo "xdebug.remote_connect_back= 1">> /etc/php/apache2/conf.d/20-xdebug.ini &&\
echo "xdebug.remote_port=9000" >> /etc/php/apache2/conf.d/20-xdebug.ini &&\
echo "xdebug.remote_host=192.168.33.10" >> /etc/php/apache2/conf.d/20-xdebug.ini &&\
sudo apachectl restart