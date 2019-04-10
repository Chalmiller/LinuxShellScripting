#!/bin/bash 

file=$1

echo "$(wc -l $file)"

if test -e $1; then
	if [ -f $1 ]; then
		echo "$1 is a file. " \
		"The line count within the file is $(wc -l $file)"
	else
		echo "$1 has an unkown type."
	fi
else
	echo "$1 does not exist."
	exit 1
fi
