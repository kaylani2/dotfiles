#!/bin/bash

CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=80 #80 percent

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    echo 'getting full...'
    mail -s 'Disk Space Alert' email@provider.com << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
fi
