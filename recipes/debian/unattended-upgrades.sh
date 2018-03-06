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
#        Unattended-Upgrades Install!
#
###############################################
"


apt-get update

apt-get install apt-listchanges -y 

echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
apt-get install unattended-upgrades -y 
