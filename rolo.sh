#!/usr/bin/env bash

#
# rolo - rolodex program to look up, add, and
# remove people from the phone book -- version 2
#
#
# If arguments are supplied, then do a lookup
#
if [[ "$#" -ne 0 ]]
then
    lu "$@"
    exit
fi

validchoice="" # set it null
#
# Loop until a valid selection is made
#
until [[ -n "$validchoice" ]]
do
 #
 # Display menu
 #
 echo 'Would you like to:
 1. Look someone up
 2. Add someone to the phone book
 3. Remove someone from the phone book
 4. Exit from the program
 Please select one of the above (1-3): \c'
 #
 # Read and process selection
 #
 read choice
 while [[ "$choice" != 4 ]]
 do
     echo
        case "$choice" in
            1) echo "Enter name to look up: \c"
                read name
                lu "$name"
                validchoice=TRUE;;
            2) echo "Enter name to be added: \c"
                read name
                echo "Enter number: \c"
                read number
                add "$name" "$number"
            validchoice=TRUE;;
            3) echo "Enter name to be removed: \c"
                read name
                rem "$name"
                validchoice=TRUE;;
            4) echo "Exiting from the program."
                exit 0;;
            *) echo "Bad choice";;
        esac
    done
done
