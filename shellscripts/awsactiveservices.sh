#!/bin/bash

##########################################################################
#This script is used to list out active services in aws
#author:ajay
#service: ec2 , s3 ,rds ,iam -users , cloudwatch .lambda 
#to execute this script we require 2 arguments region and type of service
#./awsactiveservice.sh <region-name> <service>
#
##########################################################################
#
#
if [ $# -ne 2 ]
then echo "pls provide 2 arguments ,region and service name "
	exit 1
fi

if ! command -v aws &>/dev/null
then echo "install aws version"
	exit 1
fi

if [ ! -d ~/.aws ]
then echo "configure aws "
exit 1
fi 

case $2 in 
	EC2|ec2)
	aws ec2 describe-instances --region $1 --query "Reservations[*].Instances[*].Name" --output table
	;;
    S3|s3)
	aws s3api list-buckets --query "Buckets[*].Name" --output table
	;;
    RDS|rds)
	aws rds describe-db-instances --region $1 --output table
	;;
	LAMBDA|lambda)
	aws lambda list-functions --region $1 --query "Functions[*].FunctionName" --output table
	;;
	IAM|iam)
	aws iam list-users --query "Users[*].UserName" --output table
	;;
	CLOUDWATCH|cloudwatch)
	aws cloudwatch describe-alarms --query "MetricAlarms[*].AlarmName" --output table
	;;
    *)
	echo "type correct one "EC2 OR S3" "
	exit 1
	;;
esac
