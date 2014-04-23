#############################################################################
# Script: Intro to Scripting Final
# Author: Joseph Preston
# Date: April 23, 2014
# 
# Description: The script takes the input of two files with student names
#              and grades and prints a report showing the student number
#              and their corresponding grade as well as the average for 
#              all students.
#############################################################################

## Variables
$student = Get-Content C:\studentList.txt
$grade = Get-Content C:\grades.txt
$total = ""

## Functions
function display-heading {
    cls
    write-host " *****************************************"
    write-host " ********* SEMESTER GRADE REPORT *********"
    write-host " *****************************************"
    write-host ""
    write-host " Student                            Grade"
    write-host " ------------                ------------"
}

function input-return {
    param ($student,$grade)
    for ($i = 0; $i -le $student.length; $i++) {
        write-host " $($student[$i])`t`t`t`t`t`t`t$($grade[$i])"
    }
    foreach ($j in $grade) {
        $total = $total + $j
    }
    $script:total = $total
}

## Main Script
display-heading
input-return $student $grade
write-host " The average student grade is: " ($total / $student.length)
write-host ""
write-host " *************** Thank You ***************"
write-host " *****************************************"
