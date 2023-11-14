# This sets the source and destination paths
$SourcePath = "C:\Users\Admin01\Documents"
$DestinationPath = "C:\Users\Admin01\Desktop\Backup-solution"

# This sets the log file path
# Its useful for reviewing the results of a backup operation.
$LogFile = "C:\Users\Admin01\Desktop\Backup-solution\Backup-Log-files"

# This sets the scheduled task name
$TaskName = "BackupTask"

# This runs the backup using Robocopy
$RobocopyArgs = "/MIR /LOG:$LogFile /TEE /NP /R:3 /W:5"
$RobocopyCommand = "Robocopy ""$SourcePath"" ""$DestinationPath"" $RobocopyArgs"
Invoke-Expression -Command $RobocopyCommand

# Log the timestamp and completion message
Add-Content -Path $LogFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') Backup completed successfully."