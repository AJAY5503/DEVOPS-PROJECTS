#!bin/bash
#author :ajay
read -p "enter the user you want to check" uname
if id "$uname" &>/dev/null 
then 
	echo "user exists"
else 
	echo ""$uname" not exists"
fi
