wget -q -O - https://updates.atomicorp.com/installers/atomic | sudo bash
apt-get update
apt-get install ossec-hids-serve
apt-get install ossec-hids-agent
/var/ossec/bin/ossec-control status
/var/ossec/bin/ossec-control start
service apache2 status
service apache2 start
curl -s "http://0.0.0.0/ossec/"
wget https://raw.githubusercontent.com/gellanyhassan0/gellany_ossec/main/ossec.conf
cp -r ossec.conf /var/ossec/etc/
 
