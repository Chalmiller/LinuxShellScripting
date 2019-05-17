#!/usr/bin/env bash

echo "Please enter the number you would like to calculate the factorial of: "
read factorialRange

product=1

while [[ "$factorialRange" -gt 1 ]]
do
    product=$(( product * factorialRange ))
    factorialRange=$(( factorialRange - 1 ))
done

echo "$product"
