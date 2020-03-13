#!/bin/bash -x
# Print the year is a Leap Year or not.
# Author: Naresh
# Date: 13/03/2020
echo "Enter the year : "
read year
if [ ${#year} -ne  4 ];
then
	echo "Enter 4 digit Year "
else
	if (( ($year%4 == 0 && $year%100 != 0) || $year%400 == 0 ));
	then
		echo "Given year is leap year."
	else
		echo "Given number is not leap year."
	fi
fi
