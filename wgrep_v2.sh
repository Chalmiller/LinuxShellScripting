#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]
then
    echo "Usage: wgrep <pattern> > <file>"
    exit 1
fi

if [[ "$1" = "-w" ]]
then
    window_width="$2"
    pattern="$3"
    file="$4"

    pattern_search=$(grep -B "$window_width" -A "$window_width" "$pattern" "$file")
else
    pattern="$1"
    file="$2"

    pattern_search=$(grep -B 1 -A 1 "$pattern" "$file")
fi

echo "$pattern_search"
