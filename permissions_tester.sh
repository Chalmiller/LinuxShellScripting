#!/usr/bin/env bash

file="$1"

if [[ -f "$file" ]]
then
    echo "The file $file exists."
    if [[ -w "$file" ]]
    then
        echo "The file $file has 'write' permissions."
    else
        echo "The file $file does not have 'write' permissions."
    fi
else
    echo "The file $file does not exist."
fi
