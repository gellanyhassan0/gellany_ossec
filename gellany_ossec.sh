apt-get install ossec-hids-serve
/var/ossec/bin/ossec-control status
/var/ossec/bin/ossec-control start
service apache2 status
service apache2 start
curl -s "http://0.0.0.0/ossec/"
