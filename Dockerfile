#Deriving the latest base image
FROM python:latest

LABEL Maintainer="gellanyhassan0"

WORKDIR /home

RUN wget -q -O - https://updates.atomicorp.com/installers/atomic|bash
RUN apt-get update -y
RUN apt-get install ossec-hids-server -y
RUN apt-get install ossec-hids-agent

RUN  wget https://github.com/ossec/ossec-wui/archive/master.zip
RUN  apt-get install unzip -y
RUN  unzip master.zip
RUN  mv ossec-wui-master /var/www/html/ossec
RUN  cd /var/www/html/ossec
RUN  ./setup.sh
RUN  systemctl restart apache2
RUN  apt-get update -y
RUN  apt-get install php -y
RUN  apt-get install build-essential gcc make apache2 libapache2-mod-php7.0 php7.0 php7.0-cli php7.0-common apache2-utils unzip wget sendmail inotify-tools -y
RUN /var/ossec/bin/ossec-control restart

CMD python3 -c "import signal; signal.pause()"
