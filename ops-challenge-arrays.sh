#!/bin/bash

# Script Name:					ops-challenge-arrays
# Author: 					    Juan Maldonado
# Date of latest revision:		10/25/2023
# Purpose:					    ops challenge - using arrays.


# Declaration of variables 

# This creates four strings within an array
list_of_directories=("dir1" "dir2" "dir3" "dir4")

# This variable holds number of directories 
NumberOfDirectories=${#list_of_directories[@]}

# Declaration of functions

# This creates a directory for each element in the array.
directory_maker () {
    for dir in "${list_of_directories[@]}"; do
    mkdir -p "$dir"
done
}

# This creates a .txt file in each directory
file_maker () {
    for dir in "${list_of_directories[@]}"; do
    file_name="$dir/file1.txt"
    touch "$file_name"
done
}

# Main

directory_maker
file_maker
echo "$NumberOfDirectories Directories and .txt files created successfully"

# End 