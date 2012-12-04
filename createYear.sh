#!/bin/bash


SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))
source $SCRIPT_PATH/scripts/CONF

YEAR=$1
YEARLIST=$2

mkdir $SCRIPT_PATH/$YEAR 2> /dev/null
mkdir $SCRIPT_PATH/$YEAR-output 2> /dev/null
cp $SCRIPT_PATH/scripts/* $SCRIPT_PATH/$YEAR

