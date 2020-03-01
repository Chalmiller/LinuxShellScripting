#!/usr/bin/env bash

if [[ "$#" -ne 2 ]]
then
        echo "Usage: mycp from to"
        echo "Source file name: "
        read from
        echo "Destination file name: "
        read to
else
    from="$1"
    to="$2"

    if [[ -d "$to" ]]
    then
            to="$to/$(basename $from)"
    fi

    if [ -e "$to" ]
    then
            echo "$to already exists; overwrite (yes/no)? \c"
            read answer
            if [[ "$answer" != yes ]]
            then
                    echo "Copy not performed"
                    exit 0
            fi
    fi
fi
