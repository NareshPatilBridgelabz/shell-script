#!/bin/bash -x
# Write a program WindChill.java that takes two double command-line arguments t and v and prints the wind chill.
# Author: Naresh
# Date: 14/03/2020
t=$1
v=$2
#35.74 + 0.6215*t + (0.4275*t - 35.75) * Math.pow(v, 0.16);
w=$(echo $t $v | awk '{print (35.74+0.62145*$1+(0.4275*$1-35.75)*($2^0.16))}')
echo $w
