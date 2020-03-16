
#!/bin/bash -x
# Given N distinct Coupon Numbers, how many random numbers do you need to generate distinct coupon number? This program simulates this random process.
# Author: Naresh
# Date: 16/03/2020
read -p "Enter number : " n
echo $n
index=0;
ARRAY=(0 0 0 0 0)
while(( $n > 0 ))
do
	random=$(( RANDOM%10 ))
	echo $random
	flag=false
	for(( i=0;i<$index;i++ ))
	do
		echo "for"
		if(( $random==${ARRAY[$i]} ));
		then
			echo "sdsdd"
			flag=true
			break
		fi	
	done
	echo $flag
	if [ !$flag ]
	then
		echo "flag condition"
		ARRAY[$index]=$random
		(( index++ ))
		(( n-- ))
	fi
done
echo ${ARRAY[@]}