#!/bin/bash

config_file="$HOME/.aws/config"
aws_command="s3 ls"
forbiden_exception="ForbiddenException"
log_account_id="AWS CLI executed in Account ID: "
log_no_access="You don't have access to the SSO Account ID for profile: "

# function that reads the aws config_file and gets the profile
function get_aws_profile() {
  profile_name=$(awk '/^\[profile/ {gsub(/\[profile |\]/,"",$0); print}' "$config_file")
  echo "$profile_name"
}

# function that gets the account id based on the profile
function get_account_id(){
    profile_name=$1
    config_file=$2
    grep -A 3 "\[profile $profile_name\]" "$config_file" | grep "sso_account_id" | awk '{print $3}'
}

# function that runs any passed aws command 
function run_aws_command(){
    arg1=$1
    arg2=$2
    aws $arg1 --profile $arg2
}

# function that handles exception 
# TO build file with exceptions
function handle_exception(){
    output=$1
    exception=$2
    echo "$output" | grep -q $exception
}

# function to take strings to help 
function log(){
    message=$1
    echo $message
}

# execution function
function execute_aws_command() {
    for profile_name in $(get_aws_profile) 
        do
            account_id=$(get_account_id "$profile_name" "$config_file")
            output=$(run_aws_command "$aws_command" "$profile_name" 2>&1)
            if [ $? -eq 0 ]; then
                log $log_account_id $account_id
            else
                if check_exception $output $forbiden_exception ; then
                    log $log_no_access $profile_name $account_id
                fi
            fi
    done
}

get_cloudfront_distributions

