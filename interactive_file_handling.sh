#!/usr/bin/env bash

fileName=$1

function copyFile()
{
    cpFile="$1"
    echo "Where would you like to store your copied file?"
    read fileDest
    cp "$cpFile" "$fileDest"
}

function removeFile()
{
    rmFile="$1"
    echo "Removing file $rmFile now..."
    rm "$rmFile"
}

function renameFileName()
{
    mvFile="$1"
    echo "What would you like to rename your file to?"
    read newName
    echo "Renaming file $mvFile to $newName..."
    mv "$mvFile" "$newName"
}

if [[ -f "$1" ]]
then
    tput clear
    echo "What would you like to do?
    1. Copy file to the current directory
    2. Remove the file from the current directory
    3. Rename the passed in file
    4. Exit Program"
    read choice

    case "$choice" in

    "1") echo "You have chosen to copy the file which was passed through the command line"
         copyFile "$fileName";;
    "2") echo "You have chosen to remove the file from the current directory."
         removeFile "$fileName";;
    "3") echo "You have chosen to rename the file within the current directory."
         renameFileName "$fileName";;
    "4") echo "Exiting Script"
         exit 1;;
    "*") echo "Input Error";;

    esac
fi
