#!/usr/bin/env bash

ack="$1"

#if [[ $ack == "y" || "yes" || "Yes" || "YES" || "Y" ]]
#then
#    exit 0
#else
#    exit 1
#fi

case "$ack" in
    "y"|"yes"|"Yes"|"YES"|"Y")
        exit 0;;
    *)
        exit 1;;
esac
