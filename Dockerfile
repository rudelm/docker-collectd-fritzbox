FROM alpine:latest

MAINTAINER Markus Rudel <rudel.markus+dockerimage@gmail.com>

RUN apk update
RUN apk add collectd collectd-python collectd-network py-pip libxml2-dev libxslt-dev gcc musl-dev python2-dev bash

RUN pip install fritzcollectd

ADD configs/ /etc/collectd/configs

ADD start /usr/bin/start

EXPOSE 25826

RUN pip install envtpl
RUN chmod +x /usr/bin/start

CMD start
