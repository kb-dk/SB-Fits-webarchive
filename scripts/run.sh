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

#This script reads a file, containing a list of ARC file paths, and invoke the fits_arc.sh script on each


#cat the first param
#read it one line at a time
cat $1 | while read I; do \
	#Cut the directory part out of the filename.
	ARCNAME=$(echo $I | rev | cut -d'/' -f1 | rev)
	#if the report archive does not exist in the outputdir
	if [ ! -f $OUTPUTDIR/$ARCNAME.tgz ]; then
		#copy from whereever to "here" TODO
		scp $I . 
		#fits the ARC file
		$SCRIPT_PATH/fits_arc.sh $(basename $I)
	fi
done
