#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))

source $SCRIPT_PATH/CONF

ORIGIFS=$IFS

# set $IFS to end-of-line
IFS=`echo -en "\n\b"`

for line in `ps ax | grep $SCRIPT_PATH| grep run.sh`; do
	pid=`echo $line| sed 's/^ *//g' | cut -d' ' -f1`
	echo $pid
	kill $pid
done

# set $IFS back
IFS=$ORIGIFS
