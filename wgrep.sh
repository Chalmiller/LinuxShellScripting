#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]
then
    echo "Usage: wgrep <pattern> > <file>"
    exit 1
fi

pattern="$1"
file="$2"

pattern_search=$(grep -B 1 -A 1 "$pattern" "$file")

echo "$pattern_search"
