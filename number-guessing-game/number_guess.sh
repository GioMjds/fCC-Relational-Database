#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
TRIES=0

# Get username
echo "Enter your username:"
read USERNAME

# Username should be less than 22 characters
if [[ ${#USERNAME} -gt 22 ]]
then
  echo "Username is too long. Please use up to 22 characters."
  exit
fi

# Check if user exists in database
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  # If user doesn't exist, insert new user
  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # If user exists, get their stats
  GAMES_PLAYED=$(echo $USER_INFO | cut -d'|' -f1)
  BEST_GAME=$(echo $USER_INFO | cut -d'|' -f2)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start the game
echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS
  
  # Check if input is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi
         
  ((TRIES++))
  
  if [[ $GUESS -eq $SECRET_NUMBER ]]   
  then  
    # Update user stats in database
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")  
    NEW_GAMES_PLAYED=$(($GAMES_PLAYED + 1))     
       
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
    if [[ $BEST_GAME -eq 0 || $TRIES -lt $BEST_GAME ]]
    then    
      UPDATE_STATS=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$TRIES WHERE username='$USERNAME'")
    else    
      UPDATE_STATS=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE username='$USERNAME'")
    fi    
    
    echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done