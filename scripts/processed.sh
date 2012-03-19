#!/bin/bash
OBJ=$(ls *.tgz | while read I; do tar tvzf $I | wc -l; done | sed 's/^/.+/' | bc | tail -1)
B=$(ls -l *.tgz | awk '{print $5}' | sed 's/^/.+/' | bc | tail -1); MB=$(echo $B/1000000 | bc)
F=$(ls -l *.tgz | wc -l)
echo $OBJ objekter - $MB Mbytes - $F ARC-files
