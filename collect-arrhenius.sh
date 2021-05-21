#!/bin/bash
for temp in  273 278 283 288 293 298 303 308
do
        echo $temp
sed -n '/------------------------------- Free energies ---------------------------------/,${p;/----------------------------------- SUMMARY -----------------------------------/q}'  $temp/q_analysefeps.log |head -n -2|tail -n +3 > $temp.csv
sed -i "s/$/\t$temp/" $temp.csv 
done
