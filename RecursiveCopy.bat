@echo off
setlocal enabledelayedexpansion

set /a counter=0

echo Welcome to the ROBOCOPY batch program!
:inputLoop
set /a counter+=1

rem asks the user to enter a source folder path
set /p source_folder=Enter the source folder path:

rem asks the user to enter a destination folder path
set /p destination_folder=Enter the destination folder path:

rem this checks if the source folder exists
if not exist "!source_folder!" (
	echo The source folder you have entered does not exist.
	pause
	goto inputLoop
)

rem this checks if the destination folder exists, if it does not we can create one
if not exist "!destination_folder!" (
	mkdir "destination_folder!"
	if errorlevel 1 (
		echo Failed to create the destination folder.
		pause
		goto inputLoop
	)
)

rem this will use ROBOCOPY to copy files and subdirectories
robocopy "!source_folder!" "!destination_folder!" /e

rem this checks the exit code of ROBOCOPY
if !errorlevel! equ 0 (
	echo copy operation was completed successfully.
) else (
	echo copy operation failed with error code !errorlevel!.
)

rem asks user if they want to perform another copy operation
set /p continue=Do you want to perform another copy operation? [Y/N]:
if /i "!continue!" equ "Y" goto inputLoop

pause