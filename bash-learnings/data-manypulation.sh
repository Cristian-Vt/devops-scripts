#!/bin/bash

#remove duplicates
awk 'seen[$0]++' filename

# select number of lines 
myvar=$(expr 8 \* 14)
lines=$(head -n $myvar aws-config/config.txt)
echo "$lines" > tmp.txt