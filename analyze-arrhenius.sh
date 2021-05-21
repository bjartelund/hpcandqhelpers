#!/bin/bash
source $QTOOLSPATH/qtools_init.sh
for temp in  273 278 283 288 293 298 303 308
do
        echo $temp
        cd $temp
        q_mapper.py $hij $alpha --bins 50 --skip 100 --min 10 --temp $temp --qfep_exec $QPATH/qfep
        q_analysefeps.py rep_*
        cd ..
done
