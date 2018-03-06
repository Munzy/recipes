#!/bin/bash

###################################################
#
#  git: https://git.enjen.net/munzy/recipes
# 
#  By Munzy 
#  
###################################################

echo "
###############################################
#
#        Installing SNMPD!
#
###############################################
"



read -p "Rack / Server ID? " rackSNMPD </dev/tty
wait
read -p "Room / Virtualization Type? " roomSNMPD </dev/tty
wait
read -p "Building / Hosting Company? " buildingSNMPD </dev/tty
wait
read -p "City? " citySNMPD </dev/tty
wait
read -p "Country? " countrySNMPD </dev/tty
wait
read -p "GPS Latitude? " gpsXSNMPD </dev/tty
wait
read -p "GPS Longitude? " gpsYSNMPD </dev/tty
wait
read -p "Device Owners Name? " nameSNMPD </dev/tty
wait
read -p "Email? " emailSNMPD </dev/tty
wait
cd /tmp
wget https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/distro
wait
mv /tmp/distro /usr/bin/distro
chmod +x /usr/bin/distro
wait

apt-get update
wait
apt-get install snmpd -y
wait

COMMUNITYSTRING=`openssl rand -base64 24`
wait

echo '# Change RANDOMSTRINGGOESHERE to your preferred SNMP community string' > /etc/snmp/snmpd.conf
echo "com2sec readonly  default         ${COMMUNITYSTRING}" >> /etc/snmp/snmpd.conf
echo "" >> /etc/snmp/snmpd.conf
echo "group MyROGroup v2c        readonly" >> /etc/snmp/snmpd.conf
echo "view all    included  .1" >> /etc/snmp/snmpd.conf
echo "access MyROGroup \"\"      any       noauth    exact  all    none   none" >> /etc/snmp/snmpd.conf
echo "" >> /etc/snmp/snmpd.conf
echo "syslocation ${rackSNMPD}, ${roomSNMPD}, ${buildingSNMPD}, ${citySNMPD}, ${countrySNMPD} [${gpsXSNMPD},${gpsYSNMPD}]" >> /etc/snmp/snmpd.conf
echo "syscontact ${nameSNMPD} ${emailSNMPD}" >> /etc/snmp/snmpd.conf
echo "" >> /etc/snmp/snmpd.conf
echo "#Distro Detection" >> /etc/snmp/snmpd.conf
echo "extend .1.3.6.1.4.1.2021.7890.1 distro /usr/bin/distro" >> /etc/snmp/snmpd.conf

service snmpd restart


echo "#=================================================="
echo "SNMPD Setup with community:  ${COMMUNITYSTRING}"
echo "#=================================================="

echo "#==================================================" >> /root/snmpd.community.txt
echo "SNMPD Setup with community:  ${COMMUNITYSTRING}" >> /root/snmpd.community.txt
echo "#==================================================" >> /root/snmpd.community.txt