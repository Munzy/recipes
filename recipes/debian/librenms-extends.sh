#!/bin/bash

###################################################
#
#  git: https://github.com/Munzy/recipes
# 
#  By Munzy 
#  
###################################################


## =========================================
##         LibreNMS Exentenders
## =========================================

function depends {

    apt update
    apt install wget -y
    yum install wget -y

}

function apache {
    wget https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/apache-stats.py -O /etc/snmp/apache-stats.py
    mkdir -p /var/cache/librenms/
    apt install python-urlgrabber python-pycurl -y
    echo extend apache /etc/snmp/apache-stats.py >> /etc/snmp/snmpd.conf
}

function asterisk {

    echo Future Work

    wget https://github.com/librenms/librenms-agent/blob/master/snmp/asterisk -O /etc/snmp/asterisk
    chmod +x /etc/snmp/asterisk
    echo Make sure to configure ASCLI in script.
    editor /etc/snmp/asterisk
    wait
    echo extend asterisk /etc/snmp/asterisk >> /etc/snmp/snmpd.conf

}

function bind {

    echo Future Work

}

function chip {

    echo Future Work

}

function dhcp {

    echo Future Work

}

function entropy {

    wget https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/entropy.sh -O /etc/snmp/entropy.sh
    chmod +x /etc/snmp/entropy.sh
    echo extend entropy /etc/snmp/entropy.sh >> /etc/snmp/snmpd.conf

}

function exim {

    echo Future Work

}

function fail2ban {

    wget https://github.com/librenms/librenms-agent/raw/master/snmp/fail2ban -O /etc/snmp/fail2ban
    chmod +x /etc/snmp/fail2ban
    echo extend fail2ban /etc/snmp/fail2ban -c -U >> /etc/snmp/snmpd.conf

}

function bsd_nfs_client {

    echo Future Work

}

function bsd_nfs_server {

    echo Future Work

}

function free_radius {

    echo Future Work

}

function gpsd {

    echo Future Work

}

function mailscanner {

    echo Future Work

}

function mdadm {

    wget https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/mdadm -O /etc/snmp/mdadm
    chmod +x /etc/snmp/mdadm
    echo extend mdadm /etc/snmp/mdadm >> /etc/snmp/snmpd.conf

}

function memcached {

    echo Future Work

}

function munin {

    echo Future Work

}

function mysql {

    echo Future Work

}

function nginx {

    echo Future Work

}

function nfs_clent {

    echo Future Work

}

function nsf_server {

    echo Future Work

}

function nvidia_gpu {

    echo Future Work

}

function open_grid_scheduler {

    echo Future Work

}

function os_updates {

    wget https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/osupdate -O /etc/snmp/osupdate
    chmod +x /etc/snmp/osupdate
    echo extend osupdate /etc/snmp/osupdate >> /etc/snmp/snmpd.conf

    [ ! -f /etc/apt/apt.conf.d/10periodic ] && os_updates_cron

}

function os_updates_cron {
    
    echo APT::Periodic::Update-Package-Lists \"1\"\; >> /etc/apt/apt.conf.d/10periodic

}

function php_fpm {

    echo Future Work

}

function pi_hole {

    echo Future Work

}

function portactivity {

    echo Future Work

}

function postfix {

    apt install pflogsumm -y
    yum install pflogsumm -y
    wget https://github.com/librenms/librenms-agent/raw/master/snmp/postfix-queues -O /etc/snmp/postfix-queues
    wget https://github.com/librenms/librenms-agent/raw/master/snmp/postfixdetailed -O /etc/snmp/postfixdetailed
    chmod +x /etc/snmp/postfixdetailed
    chmod +x /etc/snmp/postfix-queues
    echo extend mailq /etc/snmp/postfix-queues >> /etc/snmp/snmpd.conf
    echo extend postfixdetailed /etc/snmp/postfixdetailed >> /etc/snmp/snmpd.conf

}

function postgres {

    echo Future Work

}

function powerdns {

    echo Future Work

}

function powerdns_recursor {

    echo Future Work

}

function powerdns_dnsdist {

    echo Future Work

}

function proxmox {

    echo Future Work

}

function raspberry_pi {

    echo Future Work

}

function sdfs_info {

    echo Future Work

}

function smart {

    wget https://github.com/librenms/librenms-agent/raw/master/snmp/smart -O /etc/snmp/smart
    chmod +x /etc/snmp/smart
    echo extend smart /etc/snmp/smart >> /etc/snmp/snmpd.conf
    echo snmp ALL=\(ALL\) NOPASSWD: /etc/snmp/smart, /usr/sbin/smartctl >> /etc/sudoers
}

function squid {

    echo Future Work

}

function tinydns {

    echo Future Work

}

function unbound {

    echo Future Work

}

function ups_nut {

    echo Future Work

}

function ups_apcups {

    echo Future Work

}

function zfs {

    echo Future Work

}

function lift_off {

    # Get Depends
    depends

    # Apache
    # [ -d /etc/apache2/sites-enabled ] && apache

    # Entropy
    entropy

    # fail2ban
    #[ -d /etc/fail2ban ] && fail2ban

    # mdadm
    #[ -f /dev/md0 ] && mdadm

    # os updates
    os_updates

    # postfix
    [ -d /etc/postfix ] && postfix

    # smart
    #[ -d /etc/smartmontools ] && smart

    service snmpd restart
    systemctl restart snmpd

}


[ -f /etc/snmp/snmpd.conf ] && lift_off
