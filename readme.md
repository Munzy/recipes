# Recipes

A work in progress, for now.


## Debian Common Install Booklet.
This basically removes commonly installed apps for OpenVZ/KVM images, then installs commonly used tools, iptables, snmp, and a few other bits.

```
wget --no-check-certificate -qO- https://github.com/Munzy/recipes/raw/master/books/debian/common-install.sh | bash
```

# Common Recipes    
These are some common recipes I use for when I am doing server stuff. 
They might be useful to you as well.


## SNMP Installer



### SNMPD Installer (Deb)

```
wget --no-check-certificate -qO- https://github.com/Munzy/recipes/raw/master/recipes/debian/snmpd-install-prompt.sh | bash
```

### SNMPD Installer Hashed (Deb)

```
wget --no-check-certificate -qO- hhttps://github.com/Munzy/recipes/raw/master/recipes/debian/snmpd-install.sh | bash
```


### Unattended-upgrades

```
wget --no-check-certificate -qO- https://github.com/Munzy/recipes/raw/master/recipes/debian/unattended-upgrades.sh | bash
```
