#********************************************************************
#
#  Script Name: BJSetup.ps1 (Setup script for the PS Blackjack Game)
#  Version:     2.0
#  Author:      Joseph Preston
#  Date:        April 2, 2014 
#
#  Description: This Powershell script creates a registry key for the
#               Powershell Blackjack game under the HKEY_CURRENT_USER
#               hive
#
#********************************************************************

# Intialization Section

$key = "PSBlackjack" #Name of the registry key to be created
$value = "Credits"   #Name of the registry value to be created
$type = "string"     #Type of data stored in the new registry value
$data = "true"       #Data to be stored in the new registry value

# Functions and Filters Section

function Create-KeyAndValue {
    New-Item -name $key  #Create new registry value

    New-ItemProperty $key -name $value -Type $type -value $data
} # End Create-KeyAndValue

# Main Processing Section

Set-Location hkcu:\

Create-KeyAndValue
