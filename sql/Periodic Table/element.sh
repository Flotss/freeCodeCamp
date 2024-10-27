#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Please provide an element as an argument."
  exit 0
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Rechercher l'élément par numéro atomique, symbole ou nom
ARG=$1

# Rechercher l'élément par numéro atomique, symbole ou nom
if [[ $ARG =~ ^[0-9]+$ ]]; then
  # Si l'argument est un nombre, rechercher par numéro atomique
  ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, p.atomic_mass, t.type, p.melting_point_celsius, p.boiling_point_celsius FROM elements e JOIN properties p ON e.atomic_number = p.atomic_number JOIN types t ON p.type_id = t.type_id WHERE e.atomic_number = $ARG")
else
  # Sinon, rechercher par symbole ou nom
  ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, p.atomic_mass, t.type, p.melting_point_celsius, p.boiling_point_celsius FROM elements e JOIN properties p ON e.atomic_number = p.atomic_number JOIN types t ON p.type_id = t.type_id WHERE e.symbol = '$ARG' OR e.name = '$ARG'")
fi


if [[ -z $ELEMENT ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

# Extraire les informations de l'élément
IFS="|" read ATOMIC_NUMBER NAME SYMBOL MASS TYPE MELTING_POINT BOILING_POINT <<< "$ELEMENT"

# Afficher les informations de l'élément
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
