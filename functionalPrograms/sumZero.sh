#!/bin/bash -x 
# One Output is number of distinct triplets as well as the second output is to print the distinct triplets.
# Author: Naresh
# Date: 14/03/2020
array=(2 6 -4 2 -3 -8 5 -2)
#echo ${array[@]}
count=0
len=${#array[@]}
for(( i=0;i<$len-2;i++ ))
do
	for(( j=(( $i+1 ));j<$len-1;j++ ))
	do
		for(( k=(($j+1));k<$len;k++ ))
		do
			if (( ${array[i]}+${array[j]}+${array[k]}==0 ))
			then
				((count++))
				echo "${array[i]} ${array[j]} ${array[k]}"
			fi
		done
	done
done
echo " "
echo $count
