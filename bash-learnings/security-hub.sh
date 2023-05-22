#!/bin/bash

# Retrieve the list of accounts that are not enabled
account_ids=$(aws organizations list-accounts --query 'Accounts[].Id' --output text)

# Loop through each account ID and enable Security Hub
for account_id in $account_ids; do
    echo "Enabling Security Hub for account: $account_id"
    aws securityhub create-members --account-details AccountId=$account_id  --region us-east-1
done
