#!/bin/sh

num_1=$1
num_2=$2

read -s -p "Would you like to add or multiply the supplied numbers? (a/m)" userChoice

if [ "$userChoice" = "a" ]; then
	echo "\n$((num_1 + num_2)) is the sum of your input."
elif [ "$userChoice" = "m" ]; then
	echo "\n$((num_1 * num_2)) is the product of your input."
else
	echo "Please supply an appropriate input and try again."
fi
