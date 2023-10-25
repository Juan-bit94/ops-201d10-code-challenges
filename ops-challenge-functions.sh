#!/bin/bash

# Script Name:					ops-challenge-functions
# Author: 					Juan Maldonado
# Date of latest revision:			10/24/2023
# Purpose:					ops challenge - using functions.

# Declaration of variables 

# Declaration of functions

# This function uses the echo and last command utility to print the login hostory of the current machine.
function login_histroy () {
    echo This is the login history:
    echo
    last 
}
# Main

# this function call prints out the list of all logins 
login_histroy
login_histroy
login_histroy

# End 
