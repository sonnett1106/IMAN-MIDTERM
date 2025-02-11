#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN () {
  echo -e "\n~~~~~ Number Guessing Game ~~~~~\n" 
  echo "Enter your username: "
  read USERNAME

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME' LIMIT 1")

  if [[ -n $USER_ID ]]
  then
    GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id = '$USER_ID'")
    BEST_GAME=$($PSQL "SELECT MIN(guess_count) FROM games WHERE user_id = '$USER_ID'")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
  else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME' LIMIT 1")
  fi
  GUESS_GAME
}

GUESS_GAME () {
  SECRET_NUM=$(($RANDOM % 1000 + 1))
  ATTEMPTS=0
  SUCCESS=0
  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ $SUCCESS = 0 ]]
  do 
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]] 
    then
      echo -e "\nThat is not an integer, guess again:"
    elif [[ $GUESS -eq $SECRET_NUM ]] 
    then
      ATTEMPTS=$(($ATTEMPTS + 1))
      echo -e "\nYou guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUM. Nice job!"
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guess_count) VALUES ($USER_ID, $ATTEMPTS)")
      SUCCESS=1
    elif [[ $GUESS -lt $SECRET_NUM ]]
    then
      ATTEMPTS=$(($ATTEMPTS + 1))
      echo -e "\nIt's higher than that, guess again:"
    else
      ATTEMPTS=$(($ATTEMPTS + 1))
      echo -e "\nIt's lower than that, guess again:"
    fi
  done
}

MAIN
