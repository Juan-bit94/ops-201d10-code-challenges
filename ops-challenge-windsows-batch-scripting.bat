:: this command turns off the echoing of commands in the batch script
:: It prevents the command itself from being displayed in the console as it's executed.
@echo off

:: This command enables delayed variable expansion. 
:: It allows variables to be expanded at runtime using '!' instead of '%'.
:: Useful when you want to access the updated value of a variable within 
:: loops or conditional statments
setlocal enabledelayedexpansion

:: Script Name:              ops-challenge-windows-batch-scripting
:: Author:                   juan maldonado
:: Date of latest revision:  11/1/2023
:: Purpose:                  Ops challenge - describe what the code does


:: This line asks the user to input the source folder path 
:: and stores the user's input in the sourcepath variable
:: the /p switch is used to displayed a prompt to the user
set /p sourcePath=Enter the source folder path:

:: This line is similar to the above one, it takes user input
:: stores the user input in the variable destinationpath
set /p destinationPath=Enter the destination folder path:


:: This conditional statement checks if the source folder specified
:: by the user, if sourcePath exists. If it doesn't exist, then it
:: executes the code block enclosed in parentheses, which displays an
:: error message and then exits the script using goto:eof
if not exist "!sourcePath!\" (
	echo Error:Source folder does not exist.
	goto:eof
)

:: This conditional statement checks if 
:: the destination folder specified by the user sourcePath exists
:: If it doesn't exist, it executes the code block enclosed in parentheses
:: which displays an error message and then exits the script using goto:eof
if not exist "!destinationPath!\" (
	echo Error:Source folder does not exist.
	goto:eof
)

:: This command uses ROBOCOPY to copy files and subdirectories from
:: the source folder to the destination folder.
:: the /E switch copies subdirectories, including empty ones.
robocopy "!sourcePath!" "!destinationPath!" /E


:: This conditional statment checks the exit code of the last executed command
:: If the exit code is greater than or equal to 8, it executes the code block
:: within the first set of parentheses and displays an error message.
:: Otherwise, if the exit code is less than 8, it executes the code
:: block within the second set of parentheses, indicating that the copy
@ operation completed successfully
if errorlevel 8 (
	echo Error:ROBOCOPY encountered errors during the copy operation.
) else (
	echo Copy operation completed successfully.
)

:: This is a label used for the goto command, which is used to exit the script
:end

:: This command ends the local environment created by setlocal
:: and restores the previous environment, effectively cleaning 
:: the script's variables and settings. 
endlocal
