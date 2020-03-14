#!/bin/bash -x
# prints the Euclidean distance from the point (x, y) to the origin (0, 0).
# Author: Naresh
# Date: 14/03/2020
x=$1
y=$2
countDistance(){
	distance=$(bc <<< "scale=2;sqrt($(( $[$x*$x]+$[$y*$y] )))")
	echo $distance
}
countDistance $x $y
