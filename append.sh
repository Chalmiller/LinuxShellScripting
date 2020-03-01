#!/usr/bin/env bash

file_one="$1"
file_two="$2"

if [[ "$#" -ne 2 ]]
then
    echo "Error - The incorrect number of arguments were passed into the script.."
else
    echo "Thank you for inputting the proper number of arguments"

    if [[ -f "$file_two"  ]]
    then
        append_files=$(cat "$file_one" >> "$file_two")
        echo "Appending $file_one to a the existing file called $file_two"
        echo "$append_files"
        echo "The content of the file is now seen as: "
        display=$(cat "$file_two")
        echo "$display"
    else
        append_files_new=$(cat "$file_one" > "$file_two")
        echo "Appending $file_one to a new file called $file_two"
        echo "The content of the new file is now seen as: "
        echo "$append_files_new"
        display=$(cat "$file_two")
        echo "$display"
    fi
fi

