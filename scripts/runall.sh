#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))


source $SCRIPT_PATH/CONF

ESCAPED=`echo $SCRIPT_PATH | sed 's_/_\\\/_g' -`

for I in $(ls $SCRIPT_PATH/new??); do \

	extension=${I##*.}
	if [ $I == $extension ]; then 
		echo "echo $SCRIPT_PATH/run.sh $SCRIPT_PATH/`basename $I` \>\& $ESCAPED\/`basename $I`.log | at now";
	fi

done
