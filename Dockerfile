FROM ubuntu:latest

MAINTAINER Markus Rudel <rudel.markus+dockerimage@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install collectd curl vim python-pip libxml2-dev libxslt1-dev
RUN pip install fritzcollectd

ADD configs/ /etc/collectd/configs

ADD start /usr/bin/start

EXPOSE 25826

RUN pip install envtpl
RUN chmod +x /usr/bin/start

CMD start
