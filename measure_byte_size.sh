#!/usr/bin/env bash

byte_size="$1"

if [[ "$#" -eq 0 ]]
then
    echo "No arguments are supplied." >&2
    exit 1
elif [[ "$#" -eq 1 ]]
then
    echo "No file arguments were supplied. Exiting now..."
    exit 1
else
    for args in "${@:2}"
    do
        file_bytes=$(wc -c < "$args")
        if [[ -f "$args" ]]
        then
            if [[ "$file_bytes" -gt "$byte_size" ]]
            then
                echo "Removing the file $args now..."
                $(rm "$args")
            else
                echo "$args is smaller than $byte_size bytes. Ignoring..."
                continue
            fi
        fi
    done
fi
