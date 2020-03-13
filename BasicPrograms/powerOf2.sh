#!/bin/bash -x
# This program takes a command-line argument N and prints a table of the powers of 2 that are less # than or equal to 2^N.
# Author: Naresh
# Date: 13/03/2020
number=$1
i=0
while [ $i -le $number ]
do
	echo $[2**$i]
	((i++))
done
