# Recipes

A work in progress, for now.


## Debian Common Install Booklet.
This basically removes commonly installed apps for OpenVZ/KVM images, then installs commonly used tools, iptables, snmp, and a few other bits.

```
wget --no-check-certificate -qO- https://git.enjen.net/munzy/recipes/raw/master/books/debian/common-install.sh | bash
```