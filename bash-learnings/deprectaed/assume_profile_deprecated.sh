#!/bin/bash

grep "^\[" ~/.aws/config |sort -u | xargs | tr -d '\[ ' | tr '\]' '\n' | sed 's/profile//' | \
while read profile; \

do AWS_PROFILE_LIST=${profile} ; \

for profile in $AWS_PROFILE_LIST; do
    # <add executable code in here>
    aws s3 ls --profile # example
done

done