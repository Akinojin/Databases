#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo "~~~ Number Guessing Game ~~~"

# ask for name input
echo "Enter your username:"
read USERNAME

# check username in database
USERNAME_IN_DATABASE=$($PSQL "SELECT name, games_played, best_game FROM user_data WHERE name='$USERNAME'")
if [[ -z $USERNAME_IN_DATABASE ]]
then
  # insert user in the database
  INSERT_USER=$($PSQL "INSERT INTO user_data (name) VALUES ('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # greet the user from the database
  echo $USERNAME_IN_DATABASE | while read NAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# secret number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# ask for number guess
echo "Guess the secret number between 1 and 1000:"

# game script
while read NUMBER_GUESS
do
  NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
  # if not an integer
  if [[ ! $NUMBER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    # if equal than secret number
    if [[ "$NUMBER_GUESS" -eq "$SECRET_NUMBER" ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE user_data SET best_game='$NUMBER_OF_GUESSES' WHERE (name iLIKE '$USERNAME' OR name iLIKE '$USERNAME_IN_DATABASE') AND (best_game IS NULL OR best_game>$NUMBER_OF_GUESSES)")
      UPDATE_GAMES_COUNT=$($PSQL "UPDATE user_data SET games_played=games_played + 1 WHERE name iLIKE '$USERNAME' OR name iLIKE '$USERNAME_IN_DATABASE'")
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      exit
    else
      # if lower than secret number
      if [[ "$NUMBER_GUESS" -lt "$SECRET_NUMBER" ]]
      then
        echo "It's lower than that, guess again:"
      # if higher than secret number
      elif
        [[ "$NUMBER_GUESS" -gt "$SECRET_NUMBER" ]]
      then
        echo "It's higher than that, guess again:"
      fi
    fi    
  fi
done
