# PowerShell script for Copying files and Directories

$continue = $true

while ($continue) {
	# asks user to input a source folder path
	$source_folder = Read-Host "Enter the source folder path: "
	
	# asks user to input the destination folder path
	$destination_folder = Read-Host "Enter the destination folder path: "
	# checks if the source folder exists
	if (-not (Test-Path -Path $source_folder -PathType Container)) {
		Write-Host "Source folder you have entered does not exist."
		Continue
	}

	# checks if the destination folder exists, if not it will create one.
	if (-not (Test-Path -Path $destination_folder -PathType Container)) {
		New-Item -Path $destination_folder -ItemType Directory -ErrorAction Stop
		if ($?) {
			Write-Host "Destination folder created successfully."
		} else {
			Write-Host "Failed to create the destination folder."
			Continue
		}
	}

	# Uses the Copy-Item cmdlet to copy files and subdirectories 
	Copy-Item -Path $source_folder -Destination $destination_folder -Recurse

	if ($?) {
		Write-Host "The copy operation was successfully completed."
	} else {
		Write-Host "The copy operation failed."
	}

	# asks the user if they would like to perform another copy operation
	$userChoice = Read=Host "Do you want to perform another copy operation? [Y/N]: "
	if ($userChoice -ne 'Y') {
		$continue = $false
	}
} 