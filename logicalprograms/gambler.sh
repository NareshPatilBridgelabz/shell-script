#!/bin/bash -x
# Write a program Quadratic.java to find the roots of the equation a*x*x + b*x + c.
# Author: Naresh
# Date: 14/03/2020
read -p "Enter the stake : " stake
read -p "Enter the goal : " goal
read -p "Enter number of time : " time

win=0
loss=0
tempTime=$time
while (( $time > 0 ))
do
stackRound=$stake
	while (( stackRound < goal && stackRound > 0 ))
	do
		random=0.$(( RANDOM%10))
		if  (( $(echo "$random" | awk '{print ($1 < 0.5)}') ));
		then
			(( stackRound-- ))
		else
			(( stackRound++ ))
		fi
	done

	if ((stackRound == goal));
	then
		(( win++ ))
	else
		(( loss++ ))
	fi

	(( time-- ))
done
echo "win percentage is $(echo $win $tempTime | awk '{print ($1/$2*100)}')"
echo "loss percentage is $(echo $loss $tempTime | awk '{print ($1/$2*100)}')"
