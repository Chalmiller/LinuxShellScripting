#!/usr/bin/env bash

function addRecord()
{
    student_info=$(grep "$1" "$fileName")

    student_info_array=$(echo "$student_info" | tr ":" "\n")
    new_record=$(echo "$1" | tr ":" "\n")

    if [[ -z "$student_info" ]]
    then
        echo "Adding new student profile: $1"
        echo -e "$1 \n" >> "$fileName"
        displayMenu
    else
        if [[ "$student_info_array" = "$new_record" ]]
        then
            echo "We've found an identical record to your request."
            displayMenu
        else
            echo "We've found your student record, but the information differs from your input.
            Would you like to update the students profile with your provided info: $new_record? (y/n)"
            read update_info
            if [[ "$update_info" = y ]]
            then
                updateRecord "$new_record"
            else
                displayMenu
            fi
        fi
    fi
}

function removeRecord()
{
    student_info=$(grep "$1" "$fileName")

    if [[ -z "$student_info" ]]
    then
        echo "We're sorry, that student's information could not be found in our file."
        displayMenu
    else
        echo "We've found the record! Are you sure you want to delete it? (y/n)"
        read delete
        if [[ "$delete" = y ]]
        then
            grep -v "$1" $fileName > tempFile && mv tempFile $fileName
        else
            displayMenu
        fi
    fi
}

function updateRecord()
{
    replace=$(grep "$1" "$fileName")
    replace_string=$(echo "$replace" | tr ":" "\n")
    echo "$replace_string"
    echo "Enter the information you would like to update the student $1 with: "
    read new_info
    sed -i '' -e "s/$replace_string/$new_info/g" "$fileName"
}

function viewRecord()
{
    cat "$fileName"
    displayMenu
}

function displayMenu()
{
    echo "
    Please choose from the following options:
         1. Add a new record to the database file
         2. Remove a record from the database file
         3. Update a record in the database file
         4. View a record from the database file
         5. exit
        "
    read choice

    case "$choice" in

    "1") echo "You have chosen to add to the records
         Please enter the student record you would like to search for: "
         read student
         addRecord "$student";;
    "2") echo "You have chosen to remove a record from the database:
         Please enter the student record you would like to search for: "
         read student
         removeRecord "$student";;
    "3") echo "You have chosen to update an existing record in the database.
         Please enter the student record you would like to update: "
         read student
         updateRecord "$student";;
    "4") echo "You have chosen the search option"
         viewRecord;;
    "5") echo "Exiting Script"
         exit 1;;
    "*") echo "Input Error";;

    esac
}

loopTest=y
fileName="studentData.txt"

while [[ "$loopTest" = y ]]
do
tput clear
displayMenu
echo "Would you like to enter another option? (y/n)"
read loopTest
done
