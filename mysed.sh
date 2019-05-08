#!/usr/bin/env bash

sedCommand="$1"
fileName="$2"

sed -e "$1" < "$fileName"

status=$?

if test $status -eq 0
then
	echo "Sed command was executed."
else
	echo "Sed command cannot be initiated."
fi
