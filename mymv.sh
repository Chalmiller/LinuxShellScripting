#!/usr/bin/env bash

if [[ "$#" -ne 2 ]]
then
        echo "Usage: mymv from to"
        exit 1
fi

from="$1"
to="$2"
#
# See if destination file is a directory
#
if [[ -d "$to" ]]
then
    to="$to/$(basename $from)"
fi
#
# See if the destination file already exists
#
if [[ -e "$to" ]]
then
    echo "$to already exists; overwrite (yes/no)? \c"
    read answer
    if [[ "$answer" != yes ]]
    then
            echo "Move not performed"
            exit 0
    fi
fi
#
# Either destination doesn't exist or ''yes'' was typed
#
mv "$from" "$to"
