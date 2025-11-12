#!/bin/bash
x=0
count1=0
count2=0
while [ $x -lt 500 ]; 
do
	response=$(curl -s http://localhost:83)
	if [[ "$response" == "<h1>Hello 1</h1>" ]]; then
		((count1++))
	elif [[ "$response" == "<h1>Hello 2</h1>" ]]; then
		((count2++))
	fi
	((x++))
done

echo $count1
echo $count2
