#!/bin/bash

currDateToMin=$(date +"%b %e %H:%M")
numAttempts=$(grep "$currDateToMin" /var/log/secure | grep "Failed password" | wc -l)
ip_addr1=$(grep "$currDateToMin" /var/log/secure | grep "Failed password" | grep -o -E "[^^][0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}" | tail -1)

#echo $numAttempts
#echo $ip_addr1

if [ $numAttempts -gt 10 ]; then 
	echo "numAttempts in last minute: $numAttempts from addr $ip_addr1 " | mail -s "Failed LOGIN" root@localhost
fi
