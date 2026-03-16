#!/bin/bash


#This script is for comparing take no input from user


echo "Enter a number"
read num

if [ $num -gt 100 ]
then
	echo "Number is greater than 100"
else 
	echo "Number is 100 or less"
fi

