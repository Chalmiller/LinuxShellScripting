#!/usr/bin/env bash

if [[ "$#" -lt 2 ]]
then
    echo "error - less than two numbers passed in"
elif [[ "$#" -gt 5 ]]
then
    echo "error - only supporting up to 5 numbers"
else
    printf "%s\n" $@ | sort -n > temp
    single_line_output=$(cat temp | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g' temp > temp_line)
    display=$(cat temp_line)
    echo "$display"
fi