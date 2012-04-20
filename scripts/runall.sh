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

ESCAPED=`echo $SCRIPT_PATH | sed 's_/_\\\/_g' -`

for I in $(ls $SCRIPT_PATH/new??); do \
	
	extension=${I##*.}
	if [ $I == $extension ]; then 
		echo "echo $SCRIPT_PATH/run.sh $SCRIPT_PATH/`basename $I` \>\& $ESCAPED\/`basename $I`.log | at now";
	fi
done
