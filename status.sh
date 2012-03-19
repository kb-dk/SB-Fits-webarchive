#!/bin/bash
for I in '2005' '2006' '2007' '2008' '2009' '2010' '2011'; do echo $I: $(ls $I-output | grep tgz | wc -l) \/ $(wc -l $I/new* | tail -1); done
