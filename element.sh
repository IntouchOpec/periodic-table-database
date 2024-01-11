#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"
CONDITION=""
if [[ -z $1 ]] 
then
  echo -e "Please provide an element as an argument." 
  exit
fi
if [[ "$INPUT" =~ ^[0-9]+$ ]]
then 
  CONDITION="atomic_number=$$1"
else 
  CONDITION="symbol='$$1' OR name='$$1'"
fi
echo $WHERE
RESULT_ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE $CONDITION;")
