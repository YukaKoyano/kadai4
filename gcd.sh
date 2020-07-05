#!/bin/sh

if [ $# != 2 ]; then
  echo "input 2 arguments" 1>&2
  exit 1
fi

expr $1 + $2 >/dev/null 2>&1
if [ $? -ge 2 ]; then
    echo "input natural number" 1>&2
    exit 1
fi

if [ $1 -lt $2 ]; then
  nmbr_1=$2
  nmbr_2=$1
else
  nmbr_1=$1
  nmbr_2=$2
fi

r=`expr $nmbr_1 % $nmbr_2`
while [ 0 -lt $r ]
do
  nmbr_1=$nmbr_2
  nmbr_2=$r
  r=`expr $nmbr_1 % $nmbr_2`
done
echo $nmbr_2
return 0
