#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev unzip gitg imagemagick
bash generate-ssh.sh
bash git-config.sh
bash install-nodejs.sh
wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz
tar -xzvf ruby-2.1.1.tar.gz
cd ruby-2.1.1
./configure
make
sudo make install
cd ..
\curl -sSL https://get.rvm.io | bash -s stable --ruby
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
source ~/.rvm/scripts/rvm
gem update --system
gem update
rvmsudo gem install sqlite3
rvmsudo gem install rails
