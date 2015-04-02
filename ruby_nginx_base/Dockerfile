FROM ubuntu:14.04

ADD brightbox_ruby_ng.list /etc/apt/sources.list.d/

RUN echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu `lsb_release -cs` >> /etc/apt/sources.list.d/brightbox_ruby_ng.list \
  && echo deb-src http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu `lsb_release -cs` >> /etc/apt/sources.list.d/brightbox_ruby_ng.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6 \
  && apt-get update \
  && apt-get -yqq install ruby2.2 nginx

RUN gem install bundler

RUN rm -v /etc/nginx/nginx.conf
