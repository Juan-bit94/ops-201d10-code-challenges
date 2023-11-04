# This prints all active processes order by the highest CPU time consumption
# Get-Process : This is a cmdlet that retrieves information about all running 
# prcoesses on the system
# Sort-Object -Property CPU -Descending : this part of the command sorts the 
# processes based on the CPU property in descending order.
# Format-Table -AutoSize: This cmdlet formats the output as a table with auto
# sized columns, making it easier to read in the terminal. 
Get-Process | Sort-Object -Property CPU -Descending | Format-Table -AutoSize

# prints all active processes ordered by the highest process identification number (PID)
# Get-Process: This cmdlet retrieves a list of active processes currently running on the system
# Sort-Object -Property Id -Descending: This part of the command sorts list of processes
# It uses the Sort-Object cmdlet and it specifies that the sorting should be done
# based on the ID property, which is the prcoess identification number (PID)
# Desending parameter indicates that the sorting should be in descending order.
# format-Table -AutoSize: After sorting the list of processes, this part of the
# command formats the output as a table. 
# The -AutoSize parameter ensures that the table columns are automatically sized to fit
# the content, making it more readable in the terminal.
Get-Process | Sort-Object -Property Id -Descending | Format-Table -AutoSize

# Get-Process: this cmdlet retrieves information about all active processes currently
# running on your system.
# Sort-Object -Property WorkingSet -Descending: This part of the command sorts the list
# of processes based on their "working set" memory usage, with the -Descending parameter
# indicating that the sorting should be descending order, so processes with the highest memory
# usage will be at the top.
# Select-Object -First 5: After sorting the processes, this part of the command selects the
# first five processes, which are the top five processes.
# Format-Table -AutoSize: this cmdlet formats the output as a table with auto-sized columns
# makes it easier to read in the terminal.
Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 5 | Forma

# Start-Process: is used to initiate a new process
# -FilePath: specifies the application to run, in this case, "msedge" for Microsoft
# Edge. You can replace it with "chrome" for Google Chrome if you prefer Chrome.
# -ArgumentList: provides the URL you want to open in the browser
Start-Process -FilePath "msedge" -ArgumentList "https://owasp.org/www-project-top-ten/"

# Loop to start Notepad ten times
for ($i = 1; $i -le 10; $i++) {
    Start-Process -FilePath "notepad"
}
# The line initiates a for loop. The Loop variable $i is set to 1
# as the initial value. The loop will continue as long as $i is less than
# or equal to 10.
# $i++ increments the loop variable by 1 for each iteration
# Start-Process -FilePath "notepad" : Within the for loop, this line is
# executed ten times. It uses Start-Process cmdlet to initiate a 
# new process, which is Notepad in this case. 
# -FilePath parameter specifies the app to run. 