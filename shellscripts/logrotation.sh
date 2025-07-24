#!/bin/bash

log_dir=$1
log_file=$2

if [ ! -d "$log_dir" ];
then
echo "directory not exists "
exit 1
fi


#compressing log files which are older than 7 days and new than 30 days i.e last 8 to 29 days modified files
find "$log_dir" -type f -name "*.log" -mtime +7 -mtime -30 ! -name "*.gz" -exec gzip {} \ ; -exec echo "[$(date +%F)] Compressed : {} "  >> "$log_file" \;

find "$log_dir" -type f -name "*.gz" -mtime +30 -exec rm -f {} \ ; -exec echo "[$(date +%F)] deleted (compressed): {} >> "$log_file" \;

find "$log_dir" -type f -name "*.log" -mtime +30 -exec rm -f {} \ ; -exec echo "[$(date +%F)] deleted (uncompressed): {} >> "$log_file" \;

