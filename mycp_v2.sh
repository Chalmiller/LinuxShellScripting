#!/usr/bin/env bash

if [[ "$#" -ne 3 ]]
then
        echo "Usage: mycp from to"
        echo "Source file name: "
        read from
        echo "Destination file name: "
        read to
else
    if [[ "$1" = "-n" ]]
    then
        from="$2"
        to="$3"
        to="$to/$(basename $from)"
    else if [[ -e "$to" ]]
    then
        to="$to/$(basename $from)"
    fi
        echo "$to already exists; overwrite (yes/no)? \c"
        read answer
        if [[ "$answer" != yes ]]
        then
                echo "Copy not performed"
                exit 0
        fi
    fi
fi
