#!/bin/bash

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n" 

# Database command
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Function to get user data from the database
get_user_data() {
  local username=$1
  $PSQL "SELECT games_played, best_game FROM users WHERE username='$username';"
}

# Function to update user data in the database
update_user_data() {
  local username=$1
  local games_played=$2
  local best_game=$3
  $PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$username', $games_played, $best_game) ON CONFLICT (username) DO UPDATE SET games_played = $games_played, best_game = LEAST(users.best_game, $best_game);" > /dev/null
}

# Prompt for username
echo "Enter your username: "
read username

# Check if username is valid
if [[ ${#username} -gt 22 ]]; then
  echo "Username must be 22 characters or less."
  exit 0
fi

# Get user data
user_data=$(get_user_data "$username")
user_data=$(echo "$user_data" | xargs) # Supprime les espaces en début/fin

if [[ -z $user_data ]]; then
  echo "Welcome, $username! It looks like this is your first time here."
  games_played=0
  best_game=0
else
  IFS='|' read -r games_played best_game <<< "$user_data"
  if [[ -z $games_played || -z $best_game ]]; then
    echo "Error retrieving user data."
    exit 0
  fi
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

# Generate random number
#secret_number=$((RANDOM % 1000 + 1))
secret_number=500
GUESSES=0

# Game loop
while [[ $guess -ne $secret_number ]]; do
  echo "Guess the secret number between 1 and 1000: "
  read guess

  # Validate input
  if ! [[ $guess =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  guess=$((guess))
  GUESSES=$((GUESSES+1))
  echo $GUESSES

  if [[ $guess -lt $secret_number ]]; then
    echo -e "\nIt's higher than that, guess again:"
  elif [[ $guess -gt $secret_number ]]; then
    echo -e "\nIt's lower than that, guess again:"
  else
    echo -e "\nYou guessed it in $GUESSES tries. The secret number was $secret_number. Nice job!"
    break
  fi
done

# Update user data
games_played=$((games_played + 1))
if [[ $best_game -eq 0 || $GUESSES -lt $best_game ]]; then
  best_game=$GUESSES
fi
update_user_data "$username" "$games_played" "$best_game"
