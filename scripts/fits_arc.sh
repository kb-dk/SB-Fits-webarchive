#/bin/bash
source CONF
ARCNAME=$(echo $1 | rev | cut -d'/' -f1 | rev)
T=$(echo $ARCNAME |grep har | wc -l)
if [ $T -eq 1 ]; then
if [ ! -f $OUTPUTDIR/$ARCNAME.tgz ]; then
U=$(echo $ARCNAME-org)
rm -rf $U
./unpack_arc.sh $1 $U
rm -rf $ARCNAME
mkdir $ARCNAME
PATH=/usr/file5/bin:$PATH /home/scape/working/fits-0.6.0/fits.sh -r -i $U -o $ARCNAME
tar cvzf $OUTPUTDIR/$ARCNAME.tgz $ARCNAME/*
rm -rf $U
fi
fi
rm -rf $ARCNAME

