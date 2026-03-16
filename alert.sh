#!/bin/bash

#################
# Author: Nagendra
# version: v1
#################


#This script will set alert for disk usage
set -e
set -o
set -x
THRESHOLD=10

USAGE=$(df / |grep / | awk '{print $5}' | sed 's/%//')

if [ $USAGE -gt $THRESHOLD ]
then
      echo "Warning :disk usage is above $THRESHOLD"
else
	echo "Disk usage is normal" 
fi

