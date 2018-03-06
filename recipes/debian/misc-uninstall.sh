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
#        Removing Commonly Unused!
#
###############################################
"


apt-get purge sendmail* -y
apt-get purge bind9* -y
apt-get purge apache2* -y
apt-get purge samba* -y
apt-get purge cifs* -y

