#!/bin/bash

#mathc the pattern

var1="arn:aws:ecs:eu-north-1:888888888888:cluster/DomEcsWorkshopCluster"

# do something if mathing the pattern
# why the pattern can't be shrinked ex: [0-9]{12}
pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"
# if [[ $var1 == *:$pattern:* ]] ; then echo "do something"; fi

#using trim
trim_pattern="0-9"
if [[ $var1 == *:$pattern:* ]] ; then echo "do something" var1 | tr -dc $pattern; fi

# use grep to extract the pattern
# echo "arn:aws:ecs:eu-north-1:999999999999:cluster/DomEcsWorkshopCluster" | grep -o "[0-9]{12}*"

# using regex
REGEX='arn:aws:ecs:([^:]+):.*'
cluster="arn:aws:ecs:eu-west-1:555555555555:cluster/some-cluster"
[[ $cluster =~ $REGEX ]]
region=${BASH_REMATCH[1]} 
echo $region