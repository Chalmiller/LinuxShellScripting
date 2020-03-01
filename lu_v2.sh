#!/usr/bin/env bash

#!/bin/sh
#
# Look someone up in the phone book
#

name=$1
grep -i "$name" $PHONEBOOK > /tmp/matches$$

if [ ! -s /tmp/matches$$ ]
then
	echo "I can't find $name in the phone book"
else
	#
	# Display each of the matching entries
	#

	while read line
	do
	    first_field=$(cut -f1 -d"\t" "$line")
	    second_field=$(cut -f2 -d"\t" "$line")
		printf "$first_field $second_field"
	done < /tmp/matches$$
fi

rm /tmp/matches$$
