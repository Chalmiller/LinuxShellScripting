#!/usr/bin/env bash

if [[ "$#" == 0 ]]
then
    echo "No arguments were supplied."
    echo "Usage: ./options.sh [-c] [-l] [-d]"
else
    while getopts ":cld" opt;
    do
        case $opt in
            c )
                echo "Clearing the screen now.."
                clear=$(clear)
                echo "$clear";;
            l )
                echo "Listing the contents of the current working directory.."
                list=$(ls)
                echo "$list";;
            d )
                echo "Printing the current date and time.."
                date=$(date)
                echo "$date";;
            \? ) echo "Usage: ./options.sh [-c] [-l] [-d]";;
        esac
    done
fi


