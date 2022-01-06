#!/bin/bash
echo "BATCH_OPTIONS = -p main -n 1 -t 0:10:00 -J short-ex-mf -o ./SlrmOut/slurm.%N.%j.out -e ./SlrmOut/slurm.%N.%j.err "
mkdir -p SlrmOut
mkdir -p Output
for i in Input/dummy_*.pdb 
do 
 f="$(basename -- $i)"  
 outfile=${f::-4}".txt"
 echo Output/$outfile ":" $i
 echo "    ./myexe.sh $i > Output/$outfile"
done 
