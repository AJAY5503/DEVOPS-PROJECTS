#!/bin/bash
#author :ajay
read -p "enter the user that you want to delete " uname
if id "$uname" &>/dev/null;
then
	sudo userdel "$uname"
echo "user "$uname" deleted"
else
	echo " "$uname " doesnt exist"
fi
