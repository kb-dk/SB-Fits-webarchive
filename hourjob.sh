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

for J in '2005' '2006' '2007' '2008' '2009' '2010' '2011'; do 
	echo "$J"
	echo "copy to public webserver"
	(cd $SCRIPT_PATH/$J-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-$J/$I ]; then cp $I /home/scape/public/fits-web-$J/; fi; done)
	echo  "Generate filelists on webserver"
	(ls $SCRIPT_PATH/$J-output |grep tgz > /home/scape/public/fits-web-$J/filenames)
	echo "sum up results"
	(cd $SCRIPT_PATH/$J; ./processed.sh > /home/scape/public/fits-web-$J/README)
	echo ""
done

