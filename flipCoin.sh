#!/bin/bash -x
# Flip Coin and print percentage of Heads and Tails
# Author: Naresh
# Date: 13/03/2020

len=10
headtotal=0;
tailtotal=0;
for i in `seq $len`
do
	n=0.$(( RANDOM%100 ))
	if echo "$n > 0.6" | bc -l | grep -q 1
	then
		((tailtotal++))
	else
		((headtotal++))
	fi
done
headper=$(echo "scale=2;$headtotal/10*100" | bc)
echo $headper
tailper=$(echo "scale=2;$tailtotal/10*100" | bc)
echo $tailper
