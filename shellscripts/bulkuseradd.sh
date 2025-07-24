#!/bin/bash
while read -r name ;do
	if id "$name"  &>/dev/null;then
	      # echo "user "$name"exists"
        else
            sudo useradd "$name"
            echo "$name:devops123" | sudo chpasswd
            echo "user "$name" created "
        fi
done < names.txt	
