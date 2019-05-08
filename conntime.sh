#!/usr/bin/env bash

whoTimeMinutes=$(who | awk NR==1'{print $5}' | cut -c 4-5)
whoTimeHours=$(who | awk NR==1'{print $5}' | cut -c 1-2)

dateTimeMinutes=$(date  +"%I:%M" | cut -c 4-5)
dateTimeHours=$(date  +"%I:%M" | cut -c 1-2)

loggedHours=$(( whoTimeHours - dateTimeHours ))
loggedMinutes=$(( whoTimeMinutes - dateTimeMinutes ))

echo "The user has been logged in for $loggedHours hours and $loggedMinutes minutes"
