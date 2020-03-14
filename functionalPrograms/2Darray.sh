#!/bin/bash -x
# A library for reading in 2D arrays of integers, doubles, or booleans from standard input and printing them out to standard output.
# Author: Naresh
# Date: 14/03/2020

readArray(){
	row=$1
	column=$2
	declare -A array
	for(( i=0;i<row;i++ ))
	do
		for(( j=0;j<column;j++ ))
		do
			read -p "Enter Element : " element
			array[$i,$j]=$element
		done
	done
	echo "${array[@]}"
}
read -p "Enter the row " row
read -p "Enter the column " column
readArray $row $column
