#!/bin/bash
#author : ajay

echo "===================system info===================="
echo -e "\n device name $(uname -o)"
echo -e "\n hostname : $(hostname) "
echo -e "\n uptime : $(uptime -p)"
echo -e "\n memory used:"
free -h | grep Mem | awk '{print $3 " used out of " $2}'
echo -e "\n disk usage "
df -h | grep dev | awk '{print $3 "used out of" $4 }'
