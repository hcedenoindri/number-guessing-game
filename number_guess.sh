#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  echo "Enter your username:"
  read USERNAME
  
  # get info from db using username
  USER=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")
  # if user not found, display message 1
  if [[ -z $USER ]]
  then
    INSERT_USER=$($PSQL "INSERT INTO users(name,games_played, best_game) VALUES('$USERNAME', 1, 1000)")
    GAMES_PLAYED=1
    BEST_GAME=1000
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    # parse games_played and best_game
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name='$USERNAME'")
    # display message 2
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

    (( GAMES_PLAYED++ ))
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE name='$USERNAME'")
  fi

  SECRET_NUMBER=$(( ($RANDOM%1000)+1 ))
  echo "Guess the secret number between 1 and 1000:"
  GUESS=1001
  NUMBER_OF_GUESSES=0
  # replace numbers with nothing for input validation
  while [[ $GUESS != $SECRET_NUMBER ]]
  do
    read GUESS
    PARSED_GUESS=$(echo $GUESS | sed -r "s/[0-9]//g")
    if [[ $PARSED_GUESS != "" ]]
    then
      echo "That is not an integer, guess again:"
      GUESS=1001
      continue
    fi

    if [[ $GUESS < $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
    if [[ $GUESS > $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi
    
    (( NUMBER_OF_GUESSES++ ))
  done
  
  if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
  then 
    BEST_GAME=$NUMBER_OF_GUESSES
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$BEST_GAME WHERE name='$USERNAME'")
  fi
  
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
}

MAIN
