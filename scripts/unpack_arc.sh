#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))
source $SCRIPT_PATH/CONF

FILE=$1; 
FILENAME=$(echo $FILE | cut -d' ' -f2 | rev | cut -d'/' -f1 | rev); #WHY??
OUTPUTFOLDER=$2;

$ARC_UNPACKER_HOME/bin/unpack.sh -f $FILE -o $OUTPUTFOLDER --minResp=200 --maxResp=299 --naming=OFFSET


for unpackedFile in $OUTPUTFOLDER/*; do
	extension=`echo $unpackedFile | rev | cut -d'-' -f1| rev`
	mv $unpackedFile "$unpackedFile.$extension"
done
