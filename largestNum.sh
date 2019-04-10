#!/bin/sh

temp=0
#iterates over a list of the passed in arguments held within: ${@: $#-$#}
for i in ${@: $#-$#} 
do
  if [ $i -gt $temp ]
  then 
  	temp=$i
  fi
done

echo "The largest number entered was $temp"