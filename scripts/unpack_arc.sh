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

FILE=$1; 
FILENAME=$(echo $FILE | cut -d' ' -f2 | rev | cut -d'/' -f1 | rev); 
OUTPUTFOLDER=$2;

$ARC_UNPACKER_HOME/bin/unpack.sh -f $FILENAME -o $OUTPUTFOLDER --minResp=200 --maxResp=299 --naming=OFFSET

for unpackedFile in $OUTPUTFOLDER; do
	extension=`echo $unpachedFile | rev | cut -d'-' -f1| rev`
	mv $unpackedFile $unpackedFile.$extension
done
