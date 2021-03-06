#! /bin/bash

sudo apt-get -y install git-core curl

curl -s https://get.docker.io/ubuntu/ | sudo sh
sudo gpasswd -a hokui docker

sudo mkdir -p /var/log/hokui
sudo mkdir -p /var/data/hokui
sudo mkdir -p /var/config/hokui
sudo chown hokui:hokui /var/log/hokui
sudo chown hokui:hokui /var/data/hokui
sudo chown hokui:hokui /var/config/hokui

mkdir -p /var/log/hokui/nginx_proxy/nginx
mkdir -p /var/log/hokui/app/supervisor
mkdir -p /var/log/hokui/app/nginx
mkdir -p /var/log/hokui/app/rails
mkdir -p /var/log/hokui/mailing_list/rails

mkdir -p /var/data/hokui/db
mkdir -p /var/data/hokui/files

mkdir -p /var/config/hokui/app
mkdir -p /var/config/hokui/mailing_list

cd /var/config/hokui/app
touch application.yml
touch database.yml
touch secrets.yml
touch production.rb

cd /var/config/hokui/mailing_list
touch application.yml
touch database.yml
touch secrets.yml

cd ~
mkdir -p src/github.com/hokui
cd src/github.com/hokui

git clone https://github.com/hokui/server_config.git
git clone https://github.com/hokui/hokui.net.git
git clone https://github.com/hokui/mailing_list.git

echo 'setup completed. production-specific configuration should be set in /var/config/hokui. please logout and re-login'
