#!/bin/bash

# Script Name:					ops-challenge-arrays
# Author: 					    Juan Maldonado
# Date of latest revision:		10/25/2023
# Purpose:					    ops challenge - using arrays.

# Declaration of variables 

num_of_directories=${#list_of_directories[@]}

# This creates four strings within an array
list_of_directories=("dir1" "dir2" "dir3" "dir4")

# Declaration of functions

# This creates a directory for each element in the array.
for dir in "${list_of_directories[@]}"; do
    mkdir -p "$dir"
done

# This creates a .txt file in each directory
for dir in "${list_of_directories[@]}"; do
    file_name="$dir/newfile.txt"
    touch "$file_name"
done

# Main

echo "$num_of_directories Directories and .txt files created successfully"

# End 