#!/bin/bash -x
# Simple Dictionary program. 
# Author: Naresh
# Date: 19/03/2020
declare -A student
student[First Name]="Naresh"
student[Last Name]="Patil"
student[stream]="MCA"
student[year]=2019
student[age]=23
echo ${student[@]} 

