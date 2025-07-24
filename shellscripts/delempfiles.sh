#!/bin/bash
path=$1
find "$path" -type f -empty -exec rm {} \;
echo "deleted empty files"
