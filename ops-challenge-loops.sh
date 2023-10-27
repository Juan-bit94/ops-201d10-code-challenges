#!/bin/bash

# Script Name:					ops-challenge-loops
# Author:				        Juan Maldonado
# Date of latest revision:			10/27/2023
# Purpose:				    	ops-challenge-loops code assignment 

# Declaration of variables

# counter variable
continue_to_run=true

# variable contains into messages
introMessage="This program will display current running processes:" 

# asks user a question
userPrompt="Enter the PID of the process to kill or 'q' to quit: "

# Declaration of functions

# This function asks which PID user wants to kill
process_to_kill () {
	while [ "$continue_to_run" = true ]; do
		clear
		echo "$introMessage"
		echo "<---------------------------------->"

		# This prints out the current running process of all users.
		ps aux
		
		# This prints a prompt to the user and takes the input as a variable
		read -p "$userPrompt" input1

		# This checks if user pressed q or a PID to kill. 
		if [ "$input1" == "q" ]; then
			echo "Exiting the script."
			break
		else
            echo "killing PID "$input1"."
			kill "$input1"
		fi
		
		# This asks user in the end if they want to continue after killing a process. 
		read -p "PID $input has been killed, would you like to continue? [Y/n]: " input2
		if [ "$input2" == "n" ]; then
			echo "Script will end"
			continue_to_run=false
		else
			echo "Restarting the kill process."
		fi
    done
}

# main

process_to_kill

# end 
