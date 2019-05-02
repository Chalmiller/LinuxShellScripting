#!/usr/bin/env bash

fileName="$1"
beginLine="$2"
endLine="${3}p"

if [[ -f "$fileName" ]]
then
    echo "Display line numbers $beginLine to $endLine"
    sed -n "$beginLine,$endLine" "$fileName"
else
    echo "The argument you have passed into the script is not a file.
    Please review your input and try again."
fi
