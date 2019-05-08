#!/usr/bin/env bash

# echo $(date  +"%I:%M %p")

#dateTime=$(date +"%T" | tr ":" " ")
#
#echo "$dateTime"

dateTime=$(date +"%H:%M")
dateHours=$(echo "$dateTime" | cut -c 1-2)
dateMinutes=$(echo "$dateTime" | cut -c 4-5)
pmtime=$( expr "$dateHours" - 12 )
isNight="yes"

if [[ "$dateHours" -lt 12 ]]
then
    isNight="no"
else
    isNight="yes"
fi

case "$isNight" in
    "yes")
        echo "The current time is $pmtime:$dateMinutes PM";;
    "no")
        echo "The current time is $dateTime AM";;
esac
