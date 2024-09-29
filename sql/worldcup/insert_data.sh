#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
FILENAME="games.csv"

YEARINDEX=1
TEAMINDEX=2
WINNERTEAMINDEX=3
OPPONENTTEAMINDEX=4
WINNERGOALSINDEX=5
OPPONENTGOALSINDEX=6

# List of name of teams
TEAMS=()

# Fonction pour savoir si une équipe est déjà dans la liste
function isTeamInList() {
  for team in "${TEAMS[@]}"
  do
    if [[ $team == $1 ]]
    then
      return 0
    fi
  done
  return 1
}

# Recherche de toute les équipes dans le fichier
while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  # if first line, skip
  if [[ $year == "year" ]]
  then
    continue
  fi
  isTeamInList "$winner"
  if [[ $? -eq 1 ]]
  then
    TEAMS+=("$winner")
  fi
  isTeamInList "$opponent"
  if [[ $? -eq 1 ]]
  then
    TEAMS+=("$opponent")
  fi
done < "$FILENAME"

# Affichage de la liste des équipes
# for team in "${TEAMS[@]}"
# do
#   echo "$team"
# done

# Insertion des équipes dans la base de données
for team in "${TEAMS[@]}"
do
  $PSQL "INSERT INTO teams (name) VALUES ('$team')"
done



# Insertion des matchs dans la base de données
while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  # SELECT TEAMS ID FROM DATABASE
  WINNERID=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
  OPPONENTID=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")
  echo year : $year round : $round winner : $winner opponent : $opponent winner_goals : $winner_goals opponent_goals : $opponent_goals

  # Trim whitespace from WINNERID and OPPONENTID
  WINNERID=$(echo $WINNERID | xargs)
  OPPONENTID=$(echo $OPPONENTID | xargs)
  echo winner id : $WINNERID opponent id : $OPPONENTID
  
  # INSERT INTO GAMES
  $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($year, '$round', $WINNERID, $OPPONENTID, $winner_goals, $opponent_goals)"
done < "$FILENAME"

$PSQL "SELECT COUNT(*) FROM teams"
$PSQL "SELECT COUNT(*) FROM games"

