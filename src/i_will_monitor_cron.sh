#!/bin/bash

sudo touch /home/fself/cron_md5
sudo chmod 777 /home/fself/cron_md5
m1="$(md5sum '/etc/crontab' | awk '{print $1}')"
m2="$(cat '/home/fself/cron_md5')"

if [ "$m1" != "$m2" ] ; then
	md5sum /etc/crontab | awk '{print $1}' > /home/fself/cron_md5
	echo "KO" | mail -s "Cronfile was changed" root@debian.lan
fi
