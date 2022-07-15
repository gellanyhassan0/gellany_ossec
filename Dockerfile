#Deriving the latest base image
FROM python:latest

LABEL Maintainer="gellanyhassan0"

WORKDIR /home

RUN wget -q -O - https://updates.atomicorp.com/installers/atomic|bash
RUN apt-get update -y
RUN apt-get install ossec-hids-server -y
RUN apt-get install ossec-hids-agent -y
RUN apt-get install apache2 -y
RUN apt-get install build-essential -y

RUN  wget https://github.com/ossec/ossec-wui/archive/master.zip
RUN  apt-get install unzip -y
RUN  unzip master.zip
RUN  mv ossec-wui-master /var/www/html/ossec
RUN  printf "admin\n \n \nwww-data"|/var/www/html/ossec/./setup.sh
#printf " \n \nlocal\n \ny\ngellanyhassan0@gmail.com\ny\ny\ny\ny\nn"|/ossec-hids-3.1.0/./setup.sh
RUN  apt-get install systemd -y
RUN  echo "\nServerName localhost" >> /etc/apache2/apache2.conf 
RUN  service apache2 start
RUN  systemctl restart apache2
RUN  service apache2 status
RUN  apt-get update -y
RUN  apt-get install php -y
RUN  apt-get install build-essential gcc make apache2 libapache2-mod-php7.0 php7.0 php7.0-cli php7.0-common apache2-utils unzip wget sendmail inotify-tools -y
RUN /var/ossec/bin/ossec-control start

RUN  service apache2 start

CMD python3 -c "import signal; signal.pause()"
