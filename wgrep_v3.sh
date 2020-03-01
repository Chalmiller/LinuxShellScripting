#!/usr/bin/env bash

if [[ "$#" -eq 0 ]]
then
    echo "Usage: wgrep <pattern> <file>"
    exit 1
fi

if [[ "$1" = "-w" ]]
then
    window_width="$2"
    pattern="$3"
    for args in "${@:4}"
    do
        file="$args"
        pattern_search=$(grep -B "$window_width" -A "$window_width" "$pattern" "$file")
        echo "Running grep on the file titled $file"
        echo "$pattern_search"
    done
else
    pattern="$1"
    for args in "${@:2}"
    do
        file="$args"
        pattern_search=$(grep -B 1 -A 1 "$pattern" "$file")
        echo "Running grep on the file titled $file"
        echo "$pattern_search"
    done
fi
