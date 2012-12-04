#!/bin/bash


SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))

source $SCRIPT_PATH/scripts/CONF

for I in '2005' '2006' '2007' '2008' '2009' '2010' '2011'; do \
	echo -n "$I: "
	completed=`ls -1 $WORKINGDIR/$I-output | grep tgz | wc -l`
	echo -n $completed" / "
	scheduled=`wc -l $WORKINGDIR/$I/new?? | tail -1`
	echo -n $scheduled" / "
	progress=`find $WORKINGDIR/$I-output/ -name '*.tgz' -type f -cmin -10 | wc -l`
	echo -n $progress" in last 10 mins"" / ";
	progress=`find $WORKINGDIR/$I-output/ -name '*.tgz' -type f -cmin -120 | wc -l`
	echo -n $progress" in last 2 hours";
	echo 

done
