# This displays your username
$UserName = $env:USERNAME
Write-Host "Current username: $Username"

# This sets up variables
$UserName = Read-Host "Enter the username for the account"
$BackupPath = "C:\Backups\$UserName"

# This creates a backup folder if it doesn't exist
if (-not(Test-Path $BackupPath -PathType Container)) {
    New-Item -ItemType Directory -Path $BackupPath -Force
}

# This copies user files to the backup folder
Copy-Item -Path "C:\users\$UserName\Documents" -Destination $BackupPath -Recurse -Force

# This creates a system restore point
$RestorePointDescription = "Backup for $UserName"

# This invokes the Checkpoint-Computer cmdlet using PowerShell
try {
    Invoke-Command -ScriptBlock {
        Checkpoint-Computer -Description $using:RestorePointDescription -RestorePointType MODIFY_SETTINGS
        } -Credential (Get-Credential) -Authentication Credssp
        Write-Host "System restore point created successfully."
        } catch {
            Write-Host "Failed to create system restore point: $_"
        }
Write-Host "Backup and checkpoint process completed."
