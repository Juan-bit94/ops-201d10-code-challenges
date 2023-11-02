# Script Name:				      ops-challenge-Log-Retrieval
# Author:					          Juan Maldonado
# Date of lastest revision: 11/2/2023
# Purpose:					        ops-challenge-conditionals-code assignment

# Declaration of variables

# The path for the files the information is going to.
$last24Path = "C:\Users\Administrator02\Desktop\logs\24log.txt.txt"
$errorsPath = "C:\Users\Administrator02\Desktop\logs\errorlog.txt.txt"

# Clear the existing contents of the log files
Clear-Content $last24Path
Clear-Content $errorsPath

# Retrieves all events from system log in the last 24 hours and sends it to last_24_report
Get-WinEvent -LogName System -FilterXPath "*[System[(EventID=16) and TimeCreated[timediff(@SystemTime) <= 86400000]]]" | Format-List | Out-File -FilePath $last24Path -Append

# Retrieves all error type events and puts it in the errors_report.txt
Get-WinEvent -LogName System -ErrorAction SilentlyContinue | Where-Object { $_.LevelDisplayName -eq "Error" } | Format-List | Out-File -FilePath $errorsPath -Append

# Prints to the screen events with ID 16
Get-WinEvent -LogName System -FilterXPath "*[System[EventID=16]]" | Format-Table -AutoSize

# Prints to screen 20 recent entries 
Get-WinEvent -LogName System -MaxEvents 20 | select-Object -ExpandProperty ProviderName

# Print to the screen 500 most recent entries
Get-WinEvent -LogName System -MaxEvents 500 | Select-Object -ExpandProperty ProviderName
