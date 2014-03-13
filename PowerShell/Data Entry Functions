#--------------------------------------------------------------
# Script: PrestonFunctions.ps1 (In-Class Functions Assignment)
# Name: Joseph Preston
# Date: March 12, 2014 
#--------------------------------------------------------------

# Declare variables
$status = $false
$studentName = ""
$studentID = ""
$studentGPA = ""
$response = ""

# Functions
# Function to ask if there is data to enter
function Data-Entry {
    while (($response -ne "Y") -and ($response -ne "N")) {
        $response = Read-Host "`n`n Do you have any data to enter? (Y/N)"
            if ($response -eq "Y") {
                $script:status = $true
            }
            elseif ($response -eq "N") {
                $script:status = $false
            }
    }  
}

# Function to display data input
function Display-Input {
    Write-Host "`n`n The data you entered is as follows:"
    Write-Host "----------------------------------------"
    Write-Host "`n Student Name: $studentName"
    Write-Host "`n Student ID #: $studentID"
    Write-Host "`n Student GPA:  $studentGPA"
    Write-Host "----------------------------------------"
    
    Read-Host # Pause program
    
    Data-Entry # Call Data-Entry to ask for more data or to break while loop
}


# Main Program
Clear-Host
Write-Host "`n`n Welcome to the Student Data System"
Write-Host "`n`n          Version 1.0"

Data-Entry

while ($status -eq $true) {

    $studentName = Read-Host "Please enter the student's name."
    $studentID = Read-Host "Please enter the student's ID."
    $studentGPA = Read-Host "Please enter the student's GPA."

    Display-Input
}
