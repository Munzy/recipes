#!/bin/bash

# grab the repo we need.
yum --enablerepo=extras -y intall epel-release

# install the tool
yum -y install open-vm-tools

# service doesn't autostart, lets start it.
service vmtoolsd restart
