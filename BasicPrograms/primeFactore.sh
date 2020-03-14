#!/bin/bash -x
# Print the prime factors of number N.
# Author: Naresh
# Date: 13/03/2020

read -p "Enter the number to find its prime factors " number
for (( index=2; index<=$number; index++ ))
do
	while (( $number%$index==0 ))
	do
		primeFactor=$primeFactor$index" ";
		number=$(($number/$index));
	done
done
echo $primeFactor;
