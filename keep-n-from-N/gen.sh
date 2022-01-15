#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "usage: ./gen.sh <number_of_items>"
	 exit 0
fi
[ ! -d "./files/" ] && mkdir files
for i in $(eval echo "{1..$1}") 
	do
		echo generating file $i...
		echo File $i > ./files/db-$( printf %05d $RANDOM ).dump
   done
