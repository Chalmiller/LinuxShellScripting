#!/usr/bin/env bash

text_file="$1"
building_name="$2"
building_list=$(awk -F'!' '{ print $2}' "$text_file" | grep "$building_name")

if [[ $# != 2 ]]
then
    echo "Wrong number of arguments"
    exit 1
elif [[ -z "$building_list" ]]
then
    echo "Your input was unrecognized."
    exit 1
else
    name_split=$(grep "$building_list" "$text_file" | awk -F'!' '{ print $1 " " $3}')
    echo "$name_split"
fi
