#!/bin/bash

aws organizations list-accounts --profile $profile \
    | jq -r '[.Accounts[] |
        select(.Status=="ACTIVE")] |
        .[].Name'