#!/bin/bash
if [ $# -ne 2 ]
  then
    echo "usage: ./exec.sh <number_of_items> <number_of_items_to_keep>"
	 exit 0	
fi
# Create timestamp
timestamp=$(date '+%Y%m%d%H%M%S')
# Generate number of items
./gen.sh $1
# Check output folder
[ ! -d "./output/" ] && mkdir output
ls -lht ./files > ./output/gen_${timestamp}_time_before.txt
ls -lh  ./files > ./output/gen_${timestamp}_sort_before.txt
num_dump_files_to_keep=$2
num_dump_files=$( ls -1 ./files | grep -E "db-[0-9]+\.dump" | wc -l )
num_dump_files_to_delete=$(( $num_dump_files - $num_dump_files_to_keep ))
ls -1 ./files | grep -E "db-[0-9]+\.dump" | sort | head -n $num_dump_files_to_delete | xargs -I {} rm ./files/{}
ls -lh  ./files > ./output/gen_${timestamp}_sort_after.txt

