#!/usr/bin/env bash

#
# Remove someone from the phone book
#
name=$1
#
# Get matching entries and save in temp file
#

grep "$name" $PHONEBOOK > /tmp/matches$$
if [[ ! -s /tmp/matches$$ ]]
then
        echo "I can't find $name in the phone book"
        exit 1
fi


#
# Display matching entries one at a time and confirm removal
#
while read line
do
        echo "More than one match; please select the one to remove: "
        display "$line"
        echo "Remove this entry (y/n)? \c"
        read answer < /dev/tty

        if [[ "$answer" = y ]]
        then
                 break
        fi
done < /tmp/matches$$

rm /tmp/matches$$

if [[ "$answer" = y ]]
then
        if grep -v "^$line$" $PHONEBOOK > /tmp/phonebook$$
        then
                mv /tmp/phonebook$$ $PHONEBOOK
                echo "Selected entry has been removed"
        else
                echo "Entry not removed"
        fi
fi
