#!/bin/bash
x=0
count1=0
count2=0
count3=0
count4=0
count5=0

c1="44b477fb71a5"
c2="9326066013ee"
c3="875b682088f3"
c4="b0ff371338b4"
c5="0a4c4e0a5247"


while [ $x -lt 1000 ]; 
do
	response=$(curl -s http://localhost:8080) # -s (silent) mode silencieux, permet de ne pas afficher le chargement des requêtes.
	if [[ "$response" == "Hello de $c1!" ]]; then
		((count1++))
	elif [[ "$response" == "Hello de $c2!" ]]; then
		((count2++))
	elif [[ "$response" == "Hello de $c3!" ]]; then
		((count3++))
	elif [[ "$response" == "Hello de $c4!" ]]; then
		((count4++))
	elif [[ "$response" == "Hello de $c5!" ]]; then
		((count5++))
	fi
	((x++))
done

echo $c1" : "$count1
echo $c2" : "$count2
echo $c3" : "$count3
echo $c4" : "$count4
echo $c5" : "$count5
