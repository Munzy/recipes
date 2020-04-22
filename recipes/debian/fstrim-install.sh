#!/bin/bash

###################################################
#
#  git: https://github.com/Munzy/recipes
# 
#  By Munzy 
#  
###################################################

echo "
###############################################
#
#        Installing FSTRIM!
#
###############################################
"

FSTRIMLOC=`which fstrim`
if [ -f /etc/cron.weekly/fstrim ];
then
echo fstrim cron already installed.
else
echo "#!/bin/bash
echo \"*** \$(date -R) ***\" >> /var/log/fstrim.log
${FSTRIMLOC} -av >> /var/log/fstrim.log

" > /etc/cron.weekly/fstrim
fi

chmod +x /etc/cron.weekly/fstrim
touch /var/log/fstrim.log
