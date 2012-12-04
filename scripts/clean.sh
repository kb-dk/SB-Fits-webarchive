#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))

source $SCRIPT_PATH/CONF

rm -rf $SCRIPT_PATH/temp
rm -rf $SCRIPT_PATH/files
rm -rf $SCRIPT_PATH/new??.log
