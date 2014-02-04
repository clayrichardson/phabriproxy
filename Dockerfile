FROM ubuntu:latest

RUN apt-key update
RUN apt-get update 

RUN apt-get install -qy python-software-properties
RUN apt-get install -qy python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update

RUN apt-get install -qy nginx
RUN apt-get install -qy vim
RUN apt-get install -qy supervisor
RUN apt-get install -qy git

RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/log/supervisor

ADD ./ssl /ssl
ADD ./setup /setup
ADD ./conf /conf

ADD ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80/tcp 443/tcp

CMD ["/usr/bin/supervisord", "--nodaemon"]
