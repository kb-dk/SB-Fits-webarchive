#!/bin/bash

SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

source $SCRIPT_PATH/scripts/CONF

echo $(echo $(cat /home/scape/public/fits*/README | awk '{print $10}' |sed 's/^/.+/' | bc | tail -1)\/10 | bc) Gbytes of ARC files processed
echo $(echo $(echo $(cat /home/scape/public/fits*/README | awk '{print $1}' |sed 's/^/.+/' | bc | tail -1)\/1000000 | bc)) millions objects processed
