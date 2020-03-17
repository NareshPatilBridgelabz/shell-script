#!/bin/bash -x
# Write a Stopwatch Program for measuring the time that elapses between the start and end clicks
# Author: Naresh
# Date: 17/03/2020
start=$(date +%s)
for(( i=0;i<5;i++ ))
do
	read -p "Enter the number : " n
	echo $n
done
end=$(date +%s)
eclapes=$((end-start))
echo "Eclapes time is $eclapes"
