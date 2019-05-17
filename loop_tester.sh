#!/usr/bin/env bash

#Write a script that prints the multiplication table from 1 to 10 using:
#
#1) for loops
#
#2) while loops
#
#3) until loops


function forLoop()
{
echo "You have chosen to instantiate the 'for' loop"
for i in {1..10}
do
  for j in {1..10}
  do
     product=$(( i * j ))
     echo "$i * $j = $product"
  done
done
}

function whileLoop()
{
echo "You have chosen to instantiate the 'while' loop"
i=1
while [ "$i" -lt 11 ]
do
    j=1
    while [ "$j" -lt 11 ]
    do
        product=$(( i * j ))
        echo "$i * $j = $product"
        j=$(( j + 1 ))
    done
    i=$(( i + 1 ))
done
}

function untilLoop()
{
echo "You have chosen to instantiate the 'until' loop"
i=1
until [ "$i" -gt 10 ]
do
    j=1
    until [ "$j" -gt 10 ]
    do
        product=$(( i * j ))
        echo "$i * $j = $product"
        j=$(( j + 1 ))
    done
    i=$(( i + 1 ))
done
}

echo "What type of loop would you like to instantiate?
Please choose one of the following:
1. forLoop
2. whileLoop
3. untilLoop
"
read loopType

case "$loopType" in
    "1")
        forLoop;;
    "2")
        whileLoop;;
    "3")
        untilLoop;;
    *)
        echo "You have entered an incorrect loop type."
        exit 1
esac
