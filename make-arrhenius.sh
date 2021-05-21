#!/bin/bash
source $QTOOLSPATH/qtools_init.sh

for temp in  273 278 283 288 293 298 303 308
do
        echo $temp
        mkdir $temp
        cp feps.proc $temp/
        cp $pdb $temp/
        cd $temp
        sed -i "s/temperature              300/temperature              $temp/" feps.proc
        q_genfeps.py feps.proc --rs ../run_Q.sh --repeats 20 --pdb $pdb ../relax/relax_006.inp relax
        cd ..
done
