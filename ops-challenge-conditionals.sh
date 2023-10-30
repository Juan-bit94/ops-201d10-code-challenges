#!/bin/bash

# Script Name:					ops-challenge-loops
# Author:				        Juan Maldonado
# Date of latest revision:		10/27/2023
# Purpose:				    	ops-challenge-conditionals code assignment 

# Declaration of variables
introMessage="Welcome to the directory checker program."
userPrompt="Enter a directory you want to check for: "
list_of_directories=("dir1" "dir2" "dir3")

# Declaration of functions
create_directory() {
    read -p "Enter a name for a new directory: " userInput
    mkdir "$userInput"
    echo "Created directory: $userInput"
    echo "Now $userInput will be added to the list of directories"
    list_of_directories+=("$userInput")
	echo " Here are the directories we have on file: " 
	for dir in "${list_of_directories[@]}"; do
                echo "$dir"
done
}

check_directory() {
    echo "$introMessage"
    read -p "$userPrompt" input1
	echo "here are the directories we have: "
	for dir in "${list_of_directories[@]}"; do
                echo "$dir"
            done
	read -p "Does your request match our list?[Y/n]: " input2
		if [ "$input2" == "Y" ]; then
			echo "Great! Happy to help."
		else 
			echo "That's okay, lets create the directory and add it to our list"
			create_directory
		fi 
}

# Main
check_directory

# End
