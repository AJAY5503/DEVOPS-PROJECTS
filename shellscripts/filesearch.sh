#!/bin/bash
read -p "enter the file name correctly " file
if  find . -name "$file" &>/dev/null
then
	echo "file there"
else 
	echo "not present"
fi
