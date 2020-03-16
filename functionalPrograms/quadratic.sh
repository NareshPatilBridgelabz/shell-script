#!/bin/bash -x
# Write a program Quadratic.java to find the roots of the equation a*x*x + b*x + c.
# Author: Naresh
# Date: 14/03/2020
b=$1
c=$2
discriminant=$(bc <<< "scale=2;$b+$c-4.0*$c")
squreroot=$(bc <<< "scale=2;sqrt(discriminant)")

root1=$(bc <<< "scale=2;-$b+squreroot/2.0")
root2=$(bc <<< "scale=2;$b-squreroot/2.0")
echo $root1
echo $root2

