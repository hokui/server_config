#! /bin/bash

cd ~/src/github.com/hokui/server_config
git pull origin master
docker build -t hokui/nginx_proxy ./nginx_proxy
docker build -t hokui/ruby_nginx_base ./ruby_nginx_base

cd ~/src/github.com/hokui/hokui.net
git pull origin master
cp /var/config/hokui/app/*.yml config
docker build -t hokui/app .

cd ~/src/github.com/hokui/mailing_list
git pull origin master
cp /var/config/hokui/mailing_list/*.yml config
docker build -t hokui/mailing_list .

docker kill $(docker ps -q)

docker ps -a | grep hokui_data_production
if [ "$?" -eq 0 ]
then
  echo 'hokui_data_production already exists'
else
  docker create -v /var/data/hokui --name hokui_data_production busybox
fi

docker run -d --net=host -v /var/log/hokui/nginx_proxy/nginx:/var/log/nginx hokui/nginx_proxy
docker run -d --net=host -v /var/log/hokui/app/supervisor:/var/log/supervisor -v /var/log/hokui/app/nginx:/var/log/nginx -v /var/log/hokui/app/rails:/var/app/log --volumes-from hokui_data_production hokui/app
docker run -d --net=host -v /var/log/hokui/mailing_list/rails:/var/app/log --volumes-from hokui_data_production hokui/mailing_list
