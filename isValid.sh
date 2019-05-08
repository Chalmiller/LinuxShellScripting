#!/usr/bin/env bash

if [[ "$1" =~ ^[a-z][a-zA-Z0-9_]*$ ]]
    then
        echo "$1: yes"
    else
        echo "$1: no"
    fi
