#!/usr/bin/env bash

sudo add-apt-repository ppa:ondrej/php
echo "-- Update packages --"
sudo apt-get update
sudo apt-get -y install php7.1 php-xdebug php7.1-mysql libapache2-mod-php7.1 php7.1-mbstring
echo "-- upgrade box --"
sudo apt-get update
sudo apt-get -y upgrade
echo "-- switch php --"
sudo a2dismod php5
sudo a2enmod php7.1
echo "-- config xdebug --"
echo "zend_extension=xdebug.so" > /etc/php/7.1/apache2/conf.d/20-xdebug.ini &&\
echo "xdebug.remote_enable=1" >> /etc/php/7.1/apache2/conf.d/20-xdebug.ini &&\
echo "xdebug.remote_connect_back= 1">> /etc/php/7.1/apache2/conf.d/20-xdebug.ini &&\
echo "xdebug.remote_port=9000" >> /etc/php/7.1/apache2/conf.d/20-xdebug.ini &&\
echo "xdebug.remote_host=192.168.33.10" >> /etc/php/7.1/apache2/conf.d/20-xdebug.ini &&\
echo "-- restart apache2 --"
sudo apachectl restart
sudo sudo service apache2 restart
