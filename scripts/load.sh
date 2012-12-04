#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))

source $SCRIPT_PATH/CONF

COMPLETE=$1
SPLITS=$2

SIZE=`wc -l $COMPLETE| cut -d' ' -f1`
SPLITSIZE=`echo $SIZE / $SPLITS | bc`

split -l $SPLITSIZE $COMPLETE new


