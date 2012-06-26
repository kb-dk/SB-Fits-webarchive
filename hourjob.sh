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


# copy to public webserver
#(cd $SCRIPT_PATH/2011-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2011/$I ]; then cp $I /home/scape/public/fits-web-2011/; fi; done)
#(cd $SCRIPT_PATH/2005-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2005/$I ]; then cp $I /home/scape/public/fits-web-2005/; fi; done)
#(cd $SCRIPT_PATH/2006-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2006/$I ]; then cp $I /home/scape/public/fits-web-2006/; fi; done)
#(cd $SCRIPT_PATH/2007-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2007/$I ]; then cp $I /home/scape/public/fits-web-2007/; fi; done)
#(cd $SCRIPT_PATH/2008-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2008/$I ]; then cp $I /home/scape/public/fits-web-2008/; fi; done)
#(cd $SCRIPT_PATH/2009-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2009/$I ]; then cp $I /home/scape/public/fits-web-2009/; fi; done)
#(cd $SCRIPT_PATH/2010-output; ls | grep tgz | while read I; do if [ ! -f /home/scape/public/fits-web-2010/$I ]; then cp $I /home/scape/public/fits-web-2010/; fi; done)
# generate filelists on webserver
#(ls $SCRIPT_PATH/2011-output |grep tgz > /home/scape/public/fits-web-2011/filenames)
#(ls $SCRIPT_PATH/2005-output |grep tgz > /home/scape/public/fits-web-2005/filenames)
#(ls $SCRIPT_PATH/2006-output |grep tgz > /home/scape/public/fits-web-2006/filenames)
#(ls $SCRIPT_PATH/2007-output |grep tgz > /home/scape/public/fits-web-2007/filenames)
#(ls $SCRIPT_PATH/2008-output |grep tgz > /home/scape/public/fits-web-2008/filenames)
#(ls $SCRIPT_PATH/2009-output |grep tgz > /home/scape/public/fits-web-2009/filenames)
#(ls $SCRIPT_PATH/2010-output |grep tgz > /home/scape/public/fits-web-2010/filenames)
# sum up results
(cd $SCRIPT_PATH/2011-output; ./processed.sh > /home/scape/public/fits-web-2011/README)
#(cd $SCRIPT_PATH/2005-output; ./processed.sh > /home/scape/public/fits-web-2005/README)
(cd $SCRIPT_PATH/2006-output; ./processed.sh > /home/scape/public/fits-web-2006/README)
(cd $SCRIPT_PATH/2007-output; ./processed.sh > /home/scape/public/fits-web-2007/README)
(cd $SCRIPT_PATH/2008-output; ./processed.sh > /home/scape/public/fits-web-2008/README)
(cd $SCRIPT_PATH/2009-output; ./processed.sh > /home/scape/public/fits-web-2009/README)
(cd $SCRIPT_PATH/2010-output; ./processed.sh > /home/scape/public/fits-web-2010/README)

