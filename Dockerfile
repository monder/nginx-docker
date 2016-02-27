FROM phusion/baseimage:0.9.18

CMD ["/sbin/my_init"]
EXPOSE 80 443

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.12-1~trusty

RUN apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD confd /usr/bin/confd

RUN mkdir /etc/service/nginx
ADD nginx.sh /etc/service/nginx/run

RUN mkdir /etc/service/confd
ADD confd.sh /etc/service/confd/run

RUN mkdir -p /etc/confd/conf.d
ADD nginx.toml /etc/confd/conf.d/nginx.toml

