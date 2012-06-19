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

COMPLETE=$1
SPLITS=$2

SIZE=`wc -l $COMPLETE| cut -d' ' -f1`
SPLITSIZE=`echo $SIZE / $SPLITS | bc`

split -l $SPLITSIZE $COMPLETE new


