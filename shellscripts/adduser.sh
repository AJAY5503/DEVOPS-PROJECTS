#!/bin/bash
# author: ajay


read -p "enter user name :" uname
if id "$uname " &>/dev/null;then
	echo " $uname exits"
else 
  sudo useradd "$uname"
  read -s -p "enter password for $uname " password
  echo
  echo "$uname:$password" | chpasswd
  echo "$uname user successfully created"
fi
