# Common Recipes    
These are some common recipes I use for when I am doing server stuff. 
They might be useful to you as well.


## SNMP Installer



### SNMPD Installer (Deb)

```
wget --no-check-certificate -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/snmpd-install-prompt.sh | bash
```

### SNMPD Installer Hashed (Deb)

```
wget --no-check-certificate -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/snmpd-install.sh | bash
```


### Unattended-upgrades

```
wget --no-check-certificate -qO- https://git.enjen.net/munzy/recipes/raw/master/recipes/debian/unattended-upgrades.sh | bash
```