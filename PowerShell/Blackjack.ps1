#********************************************************************
#
#  Script Name: Blackjack.ps1 (Setup script for the PS Blackjack Game)
#  Version:     2.0
#  Author:      Joseph Preston
#  Date:        April 2, 2014 
#
#  Description: This Powershell script is a single player
#               implementation of the popular casino blackjack game
#
#  Upgrades: Player and computer start with 2 cards and the score
#            for each player card. Added win, lose, and tie scoreboard.
#            Added the choice for the player to use Ace as 1 or 11.
#
#********************************************************************

# Intialization Section

$startGame = "False"                 #Variable used to determine if the game is played
$playerBusted = "False"              #Variable used to track when the player busts
$playerHand = 0                      #Stores the current value of the player's hand
$randomNo = New-Object System.Random #This variable stores a random object
$computerHand = 0                    #Stores the current value of the computer's hand
$playAgain = "True"                  #Controls the execution of the loop that controls the
                                     #execution of logic in the main processing section

# Functions and Filters Section

#This function gets the player's permission to begin the game
function Get-Permission {
    
    #Loop until valid reply is collected
    while ($startGame -eq "False") {
        
        Clear-Host
        
        #Display the game's opening screen
        Write-Host "`n`n`n"
        Write-Host " Welcome to the" -ForegroundColor Blue
        Write-Host ""
        Write-Host ""
        Write-Host " P O W E R S H E L L   B L A C K J A C K   G A M E"` -ForegroundColor Blue
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""

        #Collect the player's input
        $response = Read-Host "`n`n`n`n`n`n`n Would you like to play? (Y/N)"

        #Validate the player's input
        if ($response -eq "Y") {  #The player wants to play
            $startGame = "True"
        } #End if
        elseif ($response -eq "N") {  #The player wants to quit
            Check-Registry
            exit  #Terminate execution script
        } #End elseif
    } #End while
} #End Get-Permission

#This function retrieves a registry value that specifies whether or not the script
#should display a splash screen if the player chooses not to play a game after
#starting the script
function Check-Registry {
    
    Clear-Host
    
    $currentLocation = Get-Location  #Keep track of the current directory
    
    Set-Location hkcu:\  #Change directory to the HKEY_CURRENT_USER hive
    
    #Retrieve the data stored in the Credits value underthe PSBlackjack subkey
    $regKey = $(Get-ItemProperty HKCU:\PSBlackjack).Credits

    if ($regKey -eq "True") {  #If the registry value is set to true display
                               #closing splash screen
        Write-Host "`n`n`n"
        Write-Host " P O W E R S H E L L   B L A C K J A C K`n`n`n"` -ForegroundColor Blue
        Write-Host "      Developed by Joseph Preston`n`n"
        Write-Host "             Copyright 2014`n`n`n`n"
        Write-Host ""

    } #End if
    Set-Location $currentLocation  #Restore the current working directory
} #End Check-Registry

#This function controls the execution of an individual round of play
function Play-Game {
    Deal-Hand  #Call the function that deals the opening hands

    Get-PlayerHand  #Call the function that manages the player's hand

    #If the player has busted the game is over, otherwise it is the computer's turn
    if ($script:playerBusted -eq "False") {
        Get-ComputerHand  #Call the function that manages the computer's hand
    } #End if

    Analyze-Results  #Call the function that analyzes game results and declares a winner
} #End Play-Game

#This function deals the player and computer's initial hands
function Deal-Hand {
    $script:playerHand = Get-Card #*2
    $script:computerHand = Get-Card #*2
} #End Deal-Hand

#This function retrieves a random number representing a card and returns the value
#of that card back to the calling statement
function Get-Card {
    $number = 0

    #Generate the game's random number (between 1-13)
    $number = $randomNo.Next(1, 14)

    if ($number -eq 1) {$number = 11} #Represents an ace !!!FIX FOR 1 OR 11!!!
    if ($number -gt 10) {$number = 10} #Represents a Jack, Queen, or King

    $number #Return the number back to the calling statements
} #End Get-Card

#This function is responsible for managing the computer's hand
function Get-ComputerHand {
    $tempCard = 0  #Stores the value of the computer's new card

    #The computer continues to take hits as long as it's hand value is less than 17
    while ($computerHand -lt 17) {
        $tempCard = Get-Card  #Get a new card for the computer

        #Add the value of the new card to the computer's hand
        $script:computerHand = $script:computerHand + $tempCard
    } #End while
} #End Get-ComputerHand

#This function analyzes and displays the results of each game
function Analyze-Results {
    Clear-Host

    #Display the player and computer's final hand
    Write-Host " `n`n`n`n RESULTS:`n`n"
    Write-Host " Player Hand:   $playerHand`n"
    Write-Host " Computer Hand: $computerHand`n`n"

    #See if the player busted
    if ($playerBusted -eq "True") {
        Write-Host "`a You have gone bust." -ForegroundColor Blue
    } #End if
    else {  #See if computer busted
        if ($computerHand -gt 21) {
            Write-Host "`a The computer has gone bust." -ForegroundColor Blue
        } #End if
        else {  #Neither the player nor the computer busted so look for a winner
            if ($playerHand -gt $computerHand) {
                Write-Host "`a You Win!" -ForegroundColor Blue
            } #End if
            if ($playerHand -eq $computerHand) {
                Write-Host "`a Tie!" -ForegroundColor Blue
            } #End if
            if ($playerHand -lt $computerHand) {
                Write-Host "`a Computer Wins!" -ForegroundColor Blue
            } #End if
        } #End else
    } #End else
} #End Analyze-Results

#This function displays the value of both player and computer's current hands and
#prompts the player to take another card
function Get-PlayerHand {
    $keepGoing = "True"  #Control the execution of the loop that manages the player's hand

    $response = ""       #Store the player's response

    #Loop until a valid reply is collected
    while ($keepGoing -eq "True") {
        Clear-Host

        #Display the player and computer's current hands
        Write-Host "`n`n"
        Write-Host ""
        Write-Host " CURRENT HAND:"
        Write-Host "`n"
        Write-Host " Player Hand:    $playerHand"
        Write-Host ""
        Write-Host " Computer Hand:  $computerHand"
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        Write-Host ""
        
        #Prompt the player to take another card
        $response = Read-Host "`n`n`n`n`n`n`n Do you want another card? (Y/N)"
        
        #Validate player's input
        if ($response -eq "Y") {
            Get-NewCard  #Get another card for the player
        }  #End if
        elseif ($response -eq "N") {
            $keepGoing = "False"
            Clear-Host
        }  #End else if

        if ($playerHand -gt 21) {
            $script:playerBusted = "True"
            $keepGoing = "False"
        }  #End if
    }  #End while
} #End Get-PlayerHand

#This function is called whenever the player elects to get a new card and is responsible
#for updating the value of the player's hand
function Get-NewCard {
    $tempCard = 0  #Stores the value of the player's new card

    $tempCard = Get-Card  #Get a new card for the player

    #Add the value of the new card to the player's hand
    $script:playerHand = $script:playerHand + $tempCard
}  #End Get-NewCard

# Main Processing Section

Get-Permission  #Call the function that asks the player for permission to start the game

#Continue playing new games until the player decides to quit the game
while ($playAgain -eq "True") {
    Play-Game  #Call the function that controls the play of the individual games

    #Prompt player to play a new game
    $response = Read-Host "`n`n`n`n`n`n`n`n`n`n Press Enter to play again or Q to quit"
    if ($response -eq "Q") {  #The player wants to quit
        $playAgain = "False"
        Clear-Host
    }  #End if
    else {  #Player did not enter Q, so let's keep playing
        $playAgain = "True"
        $playerBusted = "False"
    }  #End else
}  #End while
