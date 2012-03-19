FILE=$1; 
FILENAME=$(echo $FILE | cut -d' ' -f2 | rev | cut -d'/' -f1 | rev); 
/home/scape/working/arc-unpacker-0.2/bin/unpack.sh -f $FILENAME -o $2 --minResp=200 --maxResp=299 --naming=OFFSET
