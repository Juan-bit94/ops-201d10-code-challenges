#!/bin/bash

# Script Name:					ops-challenge-arrays
# Author: 					    Juan Maldonado
# Date of latest revision:		10/25/2023
# Purpose:					    ops challenge - using arrays.


# Declaration of functions

# This creates four strings within an array
list_of_directories=("dir1" "dir2" "dir3" "dir4")

# This creates a directory for each element in the array.
for dir in "${list_of_directories[@]}"; do
    mkdir -p "$dir"
done

# This creates a .txt file in each directory
for dir in "${list_of_directories[@]}"; do
    file_name="$dir/file1.txt"
    touch "$file_name"
done

# Declaration of variables 
NumberOfDirectories=${#list_of_directories[@]}

# Main

echo "$NumberOfDirectories Directories and .txt files created successfully"

# End 