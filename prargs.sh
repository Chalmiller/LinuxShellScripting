#!/usr/bin/env bash

# Print command line arguments one per line

count=1

while [[ "$#" -ne 0 ]]
do
    echo "$count: $1"
    count=$(expr $count + 1)
    shift
done
