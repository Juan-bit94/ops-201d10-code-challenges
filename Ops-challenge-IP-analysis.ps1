# Script Name:              Windows-10-IP-script
# Author:                   juan maldonado
# Date of latest revision:  11/07/2023
# Purpose:                  Ops challenge - Endpoint configuration
 
 # Declare variable

# intro message
$introMessage = "Welcome to the IP analyzer."

# Declare Function

# Get's user input for the file name
function Get-FileName {
    $fileName = Read-Host "Enter a file name and extension "
    return $fileName
}

# This runs ipconfig /all and save the output to a file
function save-IpConfigToFile {
    $fileName = Get-FileName
    ipconfig /all | Out-File -FilePath $fileName
    Write-Host "ipconfig output saved to $fileName."
}

# This extracts IPv4 address from the file
function Get-IPv4AddressFromFile($fileName) {
    $fileContent = Get-Content $fileName
    $ipv4Addresses = $fileContent | Select-String -Pattern "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" | ForEach-Object { $_.Matches.Value }
    return $ipv4Addresses
}

# Main 

Write-Host $introMessage
save-IpConfigToFile
$ipv4Addresses = Get-IPv4AddressFromFile $fileName

if ($ipv4Addresses.Count -eq 0) {
    Write-Host "No IPv4 addresses found in $fileName."
} else {
    Write-Host "IPv4 addresses found in $fileName : "
    $ipv4Addresses
}
