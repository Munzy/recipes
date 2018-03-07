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
#        Installing Iptables Rules!
#
###############################################
"

echo '#!/bin/bash'>/root/recipes/iptables.sh
echo '#####################################################' >>/root/recipes/iptables.sh
echo '#      IPv4'  >>/root/recipes/iptables.sh
echo '#####################################################' >>/root/recipes/iptables.sh
echo 'iptables -F' >>/root/recipes/iptables.sh
echo 'iptables -P INPUT DROP' >>/root/recipes/iptables.sh
echo 'iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT' >>/root/recipes/iptables.sh
echo 'iptables -A INPUT -i lo -m comment --comment "Allow loopback connections" -j ACCEPT' >>/root/recipes/iptables.sh
echo '#iptables -A INPUT -i tun0 -m comment --comment "Allow all on tunnel" -j ACCEPT' >>/root/recipes/iptables.sh
echo 'iptables -A INPUT -p icmp -m comment --comment "Allow Ping to work as expected" -j ACCEPT' >>/root/recipes/iptables.sh
echo 'iptables -A INPUT -p tcp -m multiport --destination-ports 22 -j ACCEPT' >>/root/recipes/iptables.sh
echo 'iptables -A INPUT -p udp -m multiport --destination-ports 161 -j ACCEPT' >>/root/recipes/iptables.sh
echo 'iptables -A FORWARD -j DROP' >>/root/recipes/iptables.sh
echo '#####################################################' >>/root/recipes/iptables.sh
echo '#      IPv6'  >>/root/recipes/iptables.sh
echo '#####################################################' >>/root/recipes/iptables.sh
echo 'ip6tables -F' >>/root/recipes/iptables.sh
echo 'ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT' >>/root/recipes/iptables.sh
echo 'ip6tables -A INPUT -i lo -m comment --comment "Allow Loopback Connections" -j ACCEPT' >>/root/recipes/iptables.sh
echo '#ip6tables -A INPUT -i tun0 -m comment --comment "Allow all on tunnel" -j ACCEPT' >>/root/recipes/iptables.sh
echo 'ip6tables -A INPUT -p icmpv6 -m comment --comment "Allow pings to fly!" -j ACCEPT' >>/root/recipes/iptables.sh
echo 'ip6tables -A INPUT -p tcp -m multiport --destination-ports 22 -j ACCEPT' >>/root/recipes/iptables.sh
echo 'ip6tables -A INPUT -p udp -m multiport --destination-ports 161 -j ACCEPT' >>/root/recipes/iptables.sh
echo 'ip6tables -A INPUT -j REJECT' >>/root/recipes/iptables.sh
echo 'ip6tables -A FORWARD -j REJECT' >>/root/recipes/iptables.sh

chmod 700 /root/recipes/iptables.sh
chmod +x /root/recipes/iptables.sh


echo "
###############################################
#
#        Launching Iptables!
#
###############################################
"

/root/recipes/iptables.sh

echo "@reboot		root 	/root/recipes/iptables.sh" >> /etc/crontab
