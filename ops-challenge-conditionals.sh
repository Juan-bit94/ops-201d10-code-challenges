#!/bin/bash

# Script Name:				ops-challenge-conditionals
# Author:				juan maldonado
# Date of latest revision:		10/29/2023
# Purpose:				A directory checker and maker


# Declaration of variables

introMessage="Welcome to the directory checker program."
userPrompt="Enter a directory you want to check for: "
list_of_directories=("dir1" "dir2" "dir3")

# Declaration of functions

function create_directory () {
	read -p "Enter a name for a new directory: " userInput
	mkdir "$userInput"
	echo "Created directory: $userInput"
	echo "Now $userInput will be added to the list of directories"
	list_of_directories+=("$userInput")
}
function check_directory () {

echo "$introMessage"
read -p "$userPrompt" input1

# check if the directory exists
# Use a for loop to check user input in array
for dir in "${list_of_directories[@]}"; do
	if [ "$input1" == "$dir" ]; then
		echo "$input1 already exists" 
		read -p "Since the directory exist, would you like to create a new directory?[Y/n]: " input2
	
		if [ "$input2" == "Y" ]; then
		create_directory
	else
		echo "before you go, here is the list of the directories we have: "
		for dir in "${list_of_directories[@]}"; do
			echo "$dir"
			echo "Script will exit now."
			break
		
done 
}

# Main

check_directory

# End
