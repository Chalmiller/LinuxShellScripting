#!/usr/bin/env bash

first_num="$1"
symbol="$2"
second_num="$3"

if [[ "$#" -ne 3 ]]
then
    echo "error - not the correct amount of arguments"
else
    case "$symbol" in

    "+") echo "You have chosen addition"
         sum=$(expr "$first_num" + "$second_num")
         echo "The sum of $first_num + $second_num is $sum";;
    "-") echo "You have chosen subtraction"
         difference=$(expr "$first_num" - "$second_num")
         echo "The difference of $first_num - $second_num is $difference";;
    "x") echo "You have chosen multiplication"
         product=$(expr "$first_num" \* "$second_num")
         echo "The product of $first_num x $second_num is $product";;
    "/") echo "You have chosen division"
         divisor=$( expr "$first_num" / "$second_num")
         echo "The divisor of $first_num / $second_num is $divisor";;
    "*") echo "Input Error"
         exit 1;;
    esac
fi