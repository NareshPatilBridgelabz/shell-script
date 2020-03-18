
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
userPlay() {
	echo "user turn"
	validPos=0
	while [ $validPos -eq 0 ]
	do
		echo "Enter a valid pos between 0-9, where u want to mark"
		read position
		markPosition "x" $position
	done
	((playCount++))
        if [ $playCount -gt 4 ]
        then
                checkforWin "x"
	else
		comPlay
	fi
}
comPlay() {
        echo "Computer turn"
        validPos=0
        while [ $validPos -eq 0 ]
        do
                position=$((RANDOM%8+1))
                markPosition "o" $position
        done
	((playCount++))
	if [ $playCount -gt 4 ]
	then
		checkforWin "o"
	else
	userPlay
	fi
}
markPosition() {
	case $2 in
		1 ) xPos=0    yPos=0  ;;
                2 ) xPos=0    yPos=2  ;;
                3 ) xPos=0    yPos=4  ;;
                4 ) xPos=2    yPos=0  ;;
	        5 ) xPos=2    yPos=2  ;;
                6 ) xPos=2    yPos=4  ;;
                7 ) xPos=4    yPos=0  ;;
                8 ) xPos=4    yPos=2  ;;
                9 ) xPos=4    yPos=4  ;;
		* )validPos=0 
		   echo "Invalid Position" ;;
	esac
	if [ ${ar[$xPos$yPos]} == "." ]
	then
		ar[$xPos$yPos]=$1
		dispBoard
		validPos=1
	else [ $1 == "x" ]
		echo "invalid position"
	fi
}
checkforWin() {
if [ $playCount -le 9 ]
then
	if [[ ${ar[00]} == $1 && ${ar[02]} == $1 && ${ar[04]} == $1 ]]
	then
		win=1
	elif [[ ${ar[20]} == $1 && ${ar[22]} == $1 && ${ar[24]} == $1 ]]
        then
                win=1
 	elif [[ ${ar[40]} == $1 && ${ar[42]} == $1 && ${ar[44]} == $1 ]]
        then
                win=1
	elif [[ ${ar[00]} == $1 && ${ar[20]} == $1 && ${ar[40]} == $1 ]]
        then
                win=1
 	elif [[ ${ar[02]} == $1 && ${ar[22]} == $1 && ${ar[42]} == $1 ]]
        then
                win=1
 	elif [[ ${ar[04]} == $1 && ${ar[24]} == $1 && ${ar[44]} == $1 ]]
        then
                win=1
	elif [[ ${ar[00]} == $1 && ${ar[22]} == $1 && ${ar[44]} == $1 ]]
        then
                win=1
	elif [[ ${ar[40]} == $1 && ${ar[22]} == $1 && ${ar[04]} == $1 ]]
        then
                win=1
	else
		win=0
	fi
fi
	if [[ $win -eq 1 && $1 == "x" ]]
	then 
		echo "User Win"
	elif [[ $win -eq 1 && $1 == "o" ]]
	then
		echo "Computer Win"
	elif [ $playCount -eq 9 ]
	then
		echo "Match Draw"
	elif [ $1 == "x" ]
	then
		comPlay
	else
		userPlay
	fi
}
echo "----------------TicTakToe game started-------------------"

playCount=0
validPos=0
initialiseBoard
dispBoard
userPlay