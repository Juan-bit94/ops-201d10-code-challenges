# This Enables File and Printer Sharing 
Enable-NetFirewallRule -Name "FPS-SMB-In-TCP"

# This allow ICMP traffic 
Enable-NetFirewallRule -Name "FPS-ICMP4-ERQ-In"

# This enables Remote Managment with PowerShell Remoting
Enable-PSRemoting -Force

# This removes bloatware apps
$appsToRemove = @(
    "BingWeather",
    "3DBuilder",
    "Getstarted"
)

ForEach ($app in $appsToRemove) {
    Get-AppxPackage -AllUsers | Where-Object { $_.Name -like "*$app*" } | Remove-AppxPackage
}

# this enable hyper-v
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All

# This disables SMBv1
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

Write-Host "Windows 10 configuration complete."

# This restart the system to apply changes
$restartOption = Read-Host "Would you like to restart the computer to apply changes? (Y/N): "
if ($restartOption -eq "Y" -or $restartOption -eq "y") {
    Write-Host "Restarting the computer..."
    Restart-Computer -Force
} 

Write-Host "Configuration is completed."