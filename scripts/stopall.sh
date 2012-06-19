#!/bin/bash
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

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
