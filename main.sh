#!/usr/bin/env bash
# Purpose: Add a confirmation when we are deleting important files
#          Otherwise delete file without confirmation
#	   Author: Guillaume MORET
# --------------------------------------"

VAR="`ls -a $1 | grep .important `"
echo $VAR
answer=""
if [ $VAR ]; then
	while [[ $answer != y || $answer != n ]];do    
	echo "This file contains a file called .important. Do you want to delete it? (y/n)"
   	 read answer 
    if [ $answer = "y" ]; then
	rm -r $1
        echo "It was important and you deleted it"
	break
    elif [ $answer = "n" ]; then
       echo "You didn't delete it"
	break
    fi
    done
else
	rm -r $1
   	echo "It contained no important file and you deleted it"	
fi
