#!/bin/bash -x
# Simulates a gambler who start with $stake and place fair $1 bets until he/she goes broke (i.e. has no money) or reach $goal. Keeps track of the number of times he/she wins and the number of bets he/she makes. Run the experiment N times, averages the results, and prints them out.
# Author: Naresh
# Date: 14/03/2020
read -p "Enter the stake : " stake
read -p "Enter the goal : " goal
read -p "Enter number of time : " time

win=0
loss=0
tempTime=$time
while [[ $stake -ge $goal ]]
do
	read -p "Enter goal more than your stack : " goal
done

while (( $time > 0 ))
do
stackRound=$stake
	while (( stackRound < goal && stackRound > 0 ))
	do	
		random=0.$(( RANDOM%10 ))
		if  (( $(echo "$random" | awk '{print ($1 < 0.5)}') ));
		then
			(( stackRound-- ))
		else
			(( stackRound++ ))
		fi
	done

	if ((stackRound == goal));
	then
		echo "won"
		(( win++ ))
	else
		echo "loss"
		(( loss++ ))
	fi
	
	
	(( time-- ))
done
echo "win percentage is $(echo $win $tempTime | awk '{print ($1/$2*100) }') %"
echo "loss percentage is $(echo $loss $tempTime | awk '{print ($1/$2*100) }') %"
