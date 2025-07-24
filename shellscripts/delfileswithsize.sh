#!/bin/bash
read -p "enter the folder name" folder
read -p "enter the max size" size

if [ ! -d "$folder" ];
then
echo "no folder found"
exit 1
fi


find "$folder" -type f -size +"$size"M -exec rm -v {} \;
echo "deleted files above the "$size"