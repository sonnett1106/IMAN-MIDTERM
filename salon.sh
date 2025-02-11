#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"

if [[ $1 ]] 
then
  echo -e "\n$1"
fi

SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
if [[ -z $SERVICES ]]
then
  echo "We don't have any services right now."
  exit
fi

echo "$SERVICES" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done

read -p "Choose a service by number: " SERVICE_ID_SELECTED
if ! [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
  echo "That is not a valid number! Choose again."
  exit
fi

VALID_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
if [[ -z $VALID_SERVICE ]]
then
  echo "I could not find that service. What would you like today?"
  exit
fi

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nI don't have a record for that phone number. What's your name?"
  read CUSTOMER_NAME
  $PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
fi

echo "What time would you like your $VALID_SERVICE, $CUSTOMER_NAME?"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
$PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"

echo -e "\nI have put you down for a $VALID_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
