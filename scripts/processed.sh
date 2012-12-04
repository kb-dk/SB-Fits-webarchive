#!/bin/bash


SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))

source $SCRIPT_PATH/CONF



OBJ=$(ls $OUTPUTDIR/*.tgz | 
# list report archives
	while read I; do  
# read lines in the list
		tar tvzf $I | wc -l
#list the files, count the lines
	done | 
	sed 's/^/.+/' | 
# Add .+ to the start of each line
	bc | 
# Add the results (. is the last result)
	tail -1)
 # Take the last line, which is the total sum


B=$(ls -l $OUTPUTDIR/*.tgz | 
#list report archives
	awk '{print $5}' | 
#extract the size from the list
	sed 's/^/.+/' | 
#format for addition
	bc | 
#add together
	tail -1); 
#only use the last line, being the sum

# use bc to calc as megabytes
MB=$(echo $B/1000000 | bc)

#count the number of files
F=$(ls -l $OUTPUTDIR/*.tgz | wc -l)

echo $OBJ objekter - $MB Mbytes - $F ARC-files
