#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))

source $SCRIPT_PATH/scripts/CONF

for I in '2005' '2006' '2007' '2008' '2009' '2010' '2011'; do \
	$SCRIPT_PATH/$I/clean.sh
done
