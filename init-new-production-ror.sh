#!/bin/bash
echo "System update and Upgrade"
sudo apt-get -y update
sudo apt-get -y upgrade

# apache2
echo "Install Apache2"
sudo apt-get -y install openssl apache2

# postgresql
echo "Install Postgresql 9.3"
sudo apt-get -y install postgresql-9.3
sudo apt-get -y install libpq-dev

# change timezone- show ui
echo "Change Time Zone"
sudo dpkg-reconfigure tzdata

# libraray for ruby
echo "Libraries for Ruby"
sudo apt-get -y install build-essential vim bison curl \
    git-core zlib1g zlib1g-dev libssl-dev \
    libreadline6 libreadline6-dev libyaml-dev \
    libxml2-dev libxslt1-dev autoconf libc6-dev \
    unzip gitg imagemagick libncurses5-dev \
    libcurl4-openssl-dev libruby1.9.1 \
    apache2-dev libapr1-dev libaprutil1-dev \
    libx11-dev libffi-dev tcl-dev tk-dev \
    libsqlite3-dev sqlite3

# nodejs
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y install python-software-properties python g++ make nodejs

# Ruby
# wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz
# tar -xzvf ruby-2.1.1.tar.gz
# cd ruby-2.1.1
# ./configure
# make
# sudo make install
# cd ..
# echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# RVM with Ruby
# at end. you must restart terminal or reconnect ssh
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Phusion Passenger
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
sudo apt-get -y install apt-transport-https ca-certificates
echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main" > /etc/apt/sources.list.d/passenger.list
sudo chown root: /etc/apt/sources.list.d/passenger.list
sudo chmod 600 /etc/apt/sources.list.d/passenger.list
sudo apt-get update
sudo apt-get -y install libapache2-mod-passenger
gem install passenger
passenger-install-apache2-module
# apache config example
# LoadModule passenger_module /usr/local/rvm/gems/ruby-2.1.1/gems/passenger-4.0.41/buildout/apache2/mod_passenger.so
#   <IfModule mod_passenger.c>
#     PassengerRoot /usr/local/rvm/gems/ruby-2.1.1/gems/passenger-4.0.41
#     PassengerDefaultRuby /usr/local/rvm/gems/ruby-2.1.1/wrappers/ruby
#   </IfModule>


# create app
read -p "App name : " app_name
sudo adduser $app_name
sudo passwd $app_name
sudo su $app_name

# rvm with ruby
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm

# create App directory
cd ~
mkdir ~/$app_name

# set up deploy key
ssh-keygen
more ~/.ssh/id_rsa.pub
more ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
echo "Remember add deploy key to github or bitbucket ..."
read

