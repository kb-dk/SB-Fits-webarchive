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

YEAR=$1
YEARLIST=$2

mkdir $SCRIPT_PATH/$YEAR 2> /dev/null
mkdir $SCRIPT_PATH/$YEAR-output 2> /dev/null
cp $SCRIPT_PATH/scripts/* $SCRIPT_PATH/$YEAR
#cp $SCRIPT_PATH/scripts/processed.sh $SCRIPT_PATH/$YEAR-output

#cp $YEARLIST $SCRIPT_PATH/$YEAR

