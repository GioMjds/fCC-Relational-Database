#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
   
if [[ -z $1 ]]
then   
  echo "Please provide an element as an argument."
  exit  
fi  
     
# Check if input is atomic_number       
if [[ $1 =~ ^[0-9]+$ ]]
then        
  ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
    FROM elements e 
    JOIN properties p ON e.atomic_number = p.atomic_number 
    JOIN types t ON p.type_id = t.type_id      
    WHERE e.atomic_number = $1")
else      
  # Check if input is symbol or name
  ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
    FROM elements e        
    JOIN properties p ON e.atomic_number = p.atomic_number 
    JOIN types t ON p.type_id = t.type_id             
    WHERE e.symbol = '$1' OR e.name = '$1'")       
fi      
    
if [[ -z $ELEMENT_INFO ]]
then     
  echo "I could not find that element in the database."   
else     
  echo "$ELEMENT_INFO" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING_POINT BOILING_POINT
  do    
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done 
fi
        