
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

source $SCRIPT_PATH/scripts/CONF

for I in '2005' '2006' '2007' '2008' '2009' '2010' '2011'; do \
	processes=`ps x | grep bash | grep new | grep -v grep | grep $I| grep run.sh | wc -l`
	running=`echo $processes/3 |bc` 
	echo "$I have $running processes "

done
