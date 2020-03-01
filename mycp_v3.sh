#!/usr/bin/env bash

numargs=$#
filelist=
copylist=

while [ "$#" -gt 1 ]
do
filelist="$filelist $1"
shift
done
to="$1"

if [ "$numargs" -lt 2  -o  "$numargs" -gt 2  -a  ! -d "$to" ]
then
    echo "Usage: mycp file1 file2"
    echo "       mycp file(s) dir"
    exit 1
fi

for from in $filelist
do
    if [ -d "$to" ]
    then
           tofile="$to/$(basename $from)"
    else
           tofile="$to"
    fi
if [ -e "$tofile" ]
then
   echo "$tofile already exists; overwrite (yes/no)? \c"
   read answer
   if [ "$answer" = yes ]
   then
   copylist="$copylist $from"
   fi
else
    copylist="$copylist $from"
fi
done
if [ -n "$copylist" ]
then
    cp $copylist $to
fi
