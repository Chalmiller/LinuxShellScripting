#!/usr/bin/env bash


for args in "$@"
do
    if [[ "$args" == "-c" ]]
    then
        echo "Would you lie to proceed with clearing the screen? (y/n)"
        read proceed

        if [[ "$proceed" == y ]]
        then
            clear
        else
            exit
        fi
    elif [[ "$args" == "-l" ]]
    then
        ls
    elif [[ "$args" == "-d" ]]
    then
        date
    elif [[ "$args" == "-e" ]]
    then
        vi
    else
        echo "the option you've passed is invalid to this script.
        Please choose either:
        -c
        -l
        -d
        -e"
    fi
done
