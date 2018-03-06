#!/bin/bash

###################################################
#
#  git: https://git.enjen.net/munzy/recipes
# 
#  By Munzy 
#  
###################################################

bash <(wget -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/snmpd-install.sh --no-check-certificate)

echo "
###############################################
#
#        No Further Responses Needed!
#
###############################################
"

bash <(wget -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/misc-uninstall.sh --no-check-certificate)

bash <(wget -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/tools-install.sh --no-check-certificate)

bash <(wget -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/iptables-install.sh --no-check-certificate)

bash <(wget -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/unattended-upgrades.sh --no-check-certificate)

bash <(wget -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/net-boost.sh --no-check-certificate)

bash <(wget -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/fstrim-install.sh --no-check-certificate)

