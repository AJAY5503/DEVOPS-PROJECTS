#!/bin/bash
service="nginx"
if systemctl is-active --quiet $service ;
then 
	echo "$service is running"
else 
	echo "$service  is not running ,trying to start it"
	sudo systemctl restart $service
	if systemctl is-active --quiet $service ;
	then 
		echo "$service restarted successfully"
	else
		echo "failed to restart $service"
	fi
fi


