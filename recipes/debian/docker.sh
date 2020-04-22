#!/bin/bash

###################################################
#
#  git: https://github.com/Munzy/recipes
# 
#  By Munzy 
#  
###################################################

apt-get remove docker docker-engine docker.io containerd runc -y

apt-get update

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common -y
    
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

echo -ne '\n' | add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
   
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

docker run hello-world
