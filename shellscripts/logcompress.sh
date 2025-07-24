#!/bin/bash
logfile=$1
backup_dir=/var/log/backuplogs
date=$(date +%F)
size=5

if [ ! -f "$logfile" ]
then
	echo "log file not present"
        exit 1
fi

asize=$(du -m "$logfile" | awk ' {print $1}')
basefile=$(basename "$logfile")

if [ "$asize"	-ge "$size" ]
then
tarfile="$backup_dir/${basefile}_$date.tar.gz"
tar -czf "$tarfile" "$logfile"
> "$logfile"
echo "log file compressed"
else
	echo "log file size not exceeded no need to compress!"
fi



