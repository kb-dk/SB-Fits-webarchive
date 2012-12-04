#!/bin/bash

SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))

source $SCRIPT_PATH/scripts/CONF

echo $(echo $(cat /home/scape/public/fits*/README | awk '{print $10}' |sed 's/^/.+/' | bc | tail -1)\/10 | bc) Gbytes of ARC files processed
echo $(echo $(echo $(cat /home/scape/public/fits*/README | awk '{print $1}' |sed 's/^/.+/' | bc | tail -1)\/1000000 | bc)) millions objects processed
