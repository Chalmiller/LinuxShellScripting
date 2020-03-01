#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]
then
    echo "Usage: collect -t <time> > <file> &"
    exit 1
fi

if [[ "$1" = "-t" ]]
then
    time_elapsed="$1"
    sleep "$time_elapsed"
    logged_users=$(who | wc -l)
    processes_running=$(ps aux | wc -l)

    echo "There were $logged_users logged in users and $processes_running processes
    running during the time interval specified"
fi
