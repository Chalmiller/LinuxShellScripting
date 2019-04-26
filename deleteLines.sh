#!/usr/bin/env bash

fileName=$1
remove=$2

echo "Removing lines containing the word $remove from the file $fileName"

grep -v "$remove" $fileName > tempFile && mv tempFile $fileName

echo "Your shortened file now contains the lines $(cat "$fileName")"
