#!/bin/bash

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

PSQL="psql -X --username=freecodecamp --tuples-only --dbname=periodic_table -c"
INPUT=$1

if [[ $INPUT =~ ^[0-9]+$ ]]; then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $INPUT" | xargs)
else
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$INPUT' OR name = '$INPUT'" | xargs)
fi

if [[ -z $ATOMIC_NUMBER ]]; then
  echo "I could not find that element in the database."
  exit
fi

RESULT=$($PSQL "
  SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type 
  FROM elements e 
  JOIN properties p ON e.atomic_number = p.atomic_number 
  JOIN types t ON p.type_id = t.type_id 
  WHERE e.atomic_number = $ATOMIC_NUMBER
")

echo "$RESULT" | while IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE; do
  echo "The element with atomic number ${ATOMIC_NUMBER// } is ${NAME// } (${SYMBOL// }). It's a ${TYPE// }, with a mass of ${ATOMIC_MASS// } amu. ${NAME// } has a melting point of ${MELTING_POINT_CELSIUS// } celsius and a boiling point of ${BOILING_POINT_CELSIUS// } celsius."
done


