#!/bin/bash

grep "^\[" ~/.aws/config |sort -u | xargs | tr -d '\[ ' | tr '\]' '\n' | sed 's/profile//' | \
while read profile; do AWS_PROFILE=${profile} ./logic.sh ; done