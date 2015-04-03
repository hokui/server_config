FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu `lsb_release -cs` main >> /etc/apt/sources.list.d/brightbox_ruby_ng.list \
  && echo deb-src http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu `lsb_release -cs` main >> /etc/apt/sources.list.d/brightbox_ruby_ng.list

RUN echo deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu `lsb_release -cs` main \
  && echo deb-src http://ppa.launchpad.net/chris-lea/node.js/ubuntu `lsb_release -cs` main

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6 \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12 \
  && apt-get update \
  && apt-get -yqq install build-essential curl git-core ruby2.2 ruby2.2-dev nginx

RUN curl -o `ruby -ropenssl -e 'p OpenSSL::X509::DEFAULT_CERT_FILE' |tr -d \"` http://curl.haxx.se/ca/cacert.pem

RUN gem install bundler

RUN rm -v /etc/nginx/nginx.conf
