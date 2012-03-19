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

#This scripts checks for fits processes that have frozen, and kills them

#echo all arcs in working dir
#replace spaces with newlines
#read the lines, one at a time
#ls the file with the full time info
#only the last line (ie. the file line)
#print the date, time, filename
#redirect all to test
echo $WORKINGDIR/*arc | sed 's/ /\n/g' | while read I; do \
	ls -lrt --full-time $I | tail -1 | awk '{print $6" "$7" "$9}';
done > test

#cat test
# disregard lines without numbers
#read the lines, one at a time
cat test | egrep [0-9] |while read I; do \

	#Get the NOW as a unix timestamp, in seconds
	N=$(date -d"now" +"%s");

	#T1 is the date and time string
	T1=$(echo $I | cut -d' ' -f1-2);
	#convert this to a unix timestamp
	T2=$(date -d"$T1" +"%s");
	#difference between NOW and file timestamp
	D=$(echo $N-$T2 | bc);
	#extract the filename, but cut the filename off at the first : (all files are names after the arc file, and some identifier, separated with an :)
	ARC=$(echo $I | cut -d' ' -f3 | cut -d':' -f1);
	#if the time difference is greater than 1 minute
	if [ $D -ge $WAIT_TIME ]; then \
		#Extract the process id that is working on the ARC file
		P=$(ps -wwwafu scape | grep $ARC |grep -v grep| awk '{print $2}');
		#Mail bja that the fits process was stopped
		echo stop process: $P $ARC | mail -s"FITS stoppet" $ADMIN_MAIL;
		#stop the process
		kill -9 $P;
	fi;
done


