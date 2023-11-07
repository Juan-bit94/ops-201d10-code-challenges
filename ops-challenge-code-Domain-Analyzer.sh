#!/bin/bash

# Script Name : Ops-challenge-code-Domain-Analyzer.sh
# Author: juan maldonado
# Date of latest revision: 11/07/2023
# Purpose: Displays information of a domain

# Declaration of variables
introMessage= echo "Wellcome to the domain information collection script."

# Declaration of functions

# This collects domain information and saves to a file
domain_info() {
	local domain="$1"
	local output_file="domain_info.txt"

	# this comand gets domain information
	whois "$domain" >> "$output_file"

	# this retrieves DNS information
	echo -e "\nDNS information for $domain : " >> "$output_file"
	dig "$domain" >> "$output_file"
	
	# this resolves the domain
	echo -e "\nDNS information for $domain :  " >> "$output_file"
	host "$domain" >> "$output_file"

	# this uses nslookup to resolve the domain
	echo -e "\nDNS information for $domain :  " >> "$output_file"
	nslookup "$domain" >> "$output_file"

	echo -e "\nDomain information has been collected and saved to $output_file."

	echo -e "\nHere is the information collected: "
	cat $output_file
}

# this function creates the file where domain info will be stored

creat_domain_file () {
	
	echo "$introMessage"
	# asks user to enter a domain name
	read -p "Please enter a fully qualified domain name (ex. www.google.com): " domain_input

	# checks if the input is empty
	if [ -z "$domain_input" ]; then
		echo "Domain cannot be empty."
		exit 1
	fi

	domain_info "$domain_input"
}


# Main

creat_domain_file 

# End
