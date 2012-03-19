#!/bin/bash
source CONF
cat $1 | while read I; do \
ARCNAME=$(echo $I | rev | cut -d'/' -f1 | rev)
if [ ! -f $OUTPUTDIR/$ARCNAME.tgz ]; then
scp $I . 
./fits_arc.sh $(basename $I)
fi
done
