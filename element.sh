#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
echo -e "\n~~~~ Periodic Table ~~~~\n"
CONDITION=""
if [[ -z $1 ]] 
then
  echo -e "Please provide an element as an argument." 
  exit
fi

if [[ "$1" =~ ^[0-9]+$ ]]
then 
  CONDITION="atomic_number=$1"
else 
  CONDITION="symbol='$1' OR name='$1'"
fi

RESULT_ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE $CONDITION;")

if [[ -z $RESULT_ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit
fi
