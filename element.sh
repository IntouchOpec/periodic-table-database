#!/bin/bash
echo -e "\nPlease provide an element as an argument.\n"
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
read INPUT
