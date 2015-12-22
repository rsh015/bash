#!/bin/bash

#There is a crontab entry to run this script every hour

#Finding the public IP
MYIP=$(wget http://ipinfo.io/ip -qO -)
if [ "$MYIP" = "`cat ~/lkpip.txt`" ]; then
    exit 0
else
    echo "Your new Public IP is: $MYIP"|mail -s "Public IP has changed" myrpialerts@gmail.com
    echo $MYIP > /home/pi/lkpip.txt
fi
