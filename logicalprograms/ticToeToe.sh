
#!/bin/bash -x
# Write a Program to play a Cross Game or Tic-Tac-Toe Game. Player 1 is the Computer and the Player 2 is the user. Player 1 take Random Cell that is the Column and Row. 
# Author: Naresh
# Date: 17/03/2020
intializeBoard(){
	for(( i=0;i<5;i++ ))
	do
		for(( j=0;j<5;j++ ))
		do
			if [[ $(( $i % 2 )) -eq 1 && $(( $j % 2 )) -eq 0 ]]
			then
				arr[$i$j]="-"
			elif [[ $(( $i % 2 )) -eq 0 && $(( $j % 2 )) -eq 1 ]]
			then
				arr[$i$j]="|"
			elif [[ $(( $i % 2 )) -eq 1 && $(( $j % 2 )) -eq 1 ]]
			then
				arr[$i$j]="+"
			elif [[ $(( $i % 2 )) -eq 0 && $(( $j % 2 )) -eq 0 ]]
			then
				arr[$i$j]="."
			fi
		done
	done
}
printBoard(){
	for(( i=0;i<5;i++ ))
	do
		for(( j=0;j<5;j++ ))
		do
			echo -ne ${arr[$i$j]}
		done
		echo
	done
}
userPlay(){
	while [[ $validPos -eq 0 ]]
	do
		read -p "Enter The mark : " userMark
		fillBoard $userMark "x"
	done
	validPos=0
	compPlay
}
compPlay(){
	while [[ $validPos -eq 0 ]]
	do
		read -p "Computer Enter The mark : " compMark
		fillBoard $compMark "o"
	done
	validPos=0
	userPlay
}
fillBoard(){
	case $1 in
		1 ) x=0 y=0 ;;
		2 ) x=0 y=2 ;;
		3 ) x=0 y=4 ;;
		4 ) x=2 y=0 ;;
		5 ) x=2 y=2 ;;
		6 ) x=2 y=4 ;;
		7 ) x=4 y=0 ;;
		8 ) x=4 y=2 ;;
		9 ) x=4 y=4 ;;
		* ) validPos=1 
		    echo "invalid position.";;
	esac
	if [ ${arr[$x$y]} == "." ]
	then
		arr[$x$y]=$2
		printBoard
		validPos=1
	else 	
		validPos=0;
		echo "invalid position."
	fi
}
validPos=0
intializeBoard
printBoard

userPlay
