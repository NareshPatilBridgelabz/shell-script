#!/bin/bash -x
# Print the Nth Harmonic Value.
# Author: Naresh
# Date: 13/03/2020
N=$1
i=1
harmonic=0
while [ $i -le $N ]
do
	harmonic=$(echo "scale=3;$harmonic+1/$i" |bc)
	((i++))
done 
echo $harmonic
