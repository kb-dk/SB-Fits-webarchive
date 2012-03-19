#!/bin/bash
source CONF
echo $WORKINGDIR/*arc | sed 's/ /\n/g' | while read I; do ls -lrt --full-time $I | tail -1 | awk '{print $6" "$7" "$9}'; done > test
cat test | egrep [0-9] |while read I; do N=$(date -d"now" +"%s"); T1=$(echo $I | cut -d' ' -f1-2); T2=$(date -d"$T1" +"%s"); D=$(echo $N-$T2 | bc); ARC=$(echo $I | cut -d' ' -f3 | cut -d':' -f1); if [ $D -ge 3600 ]; then P=$(ps -wwwafu scape | grep $ARC |grep -v grep| awk '{print $2}'); echo stop process: $P $ARC | mail -s"FITS stoppet" bja@statsbiblioteket.dk; kill -9 $P; fi; done


