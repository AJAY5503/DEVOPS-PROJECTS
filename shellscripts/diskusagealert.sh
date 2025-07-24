#!bin/bash
set -x
#author :ajay
threshold=80
usage=$(df -h /root | awk 'NR==2 {print $5}' |sed 's/%//')
res=$((threshold - usage))
if [ $usage -ge $threshold ];
then 
	echo "WARNING ,disk usage is above "$threshold" "
else 
	echo ""$res" is left to reach threshold"
fi
