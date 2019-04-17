#!/bin/sh

num_1=$1
num_2=$2

if [ num_1 -gt num_2 ]; then
	echo "The first number $num_1 is larger than $num_2"
else
	echo "The second number $num_2 is larger than $num_1"
