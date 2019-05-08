#!/usr/bin/env bash

stringName="$1"
suffix="$2"

echo "$stringName" | sed "s/$suffix$//g"
