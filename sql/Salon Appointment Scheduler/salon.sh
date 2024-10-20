#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

# Query to get services
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id ASC")

# Declare an associative array
declare -A services_array

# Populate the associative array
while IFS="|" read -r service_id name; do
  services_array[$service_id]=$name
done <<< "$SERVICES"

# Function to print the list of services
function printService() {
  for service_id in $(echo "${!services_array[@]}" | tr ' ' '\n' | sort -n); do
    echo "$service_id) ${services_array[$service_id]}"
  done
}

# Function to prompt user to pick a service
function pickService() {
  while true; do
    printService
    read SERVICE_ID_SELECTED
    if [[ -n "${services_array[$SERVICE_ID_SELECTED]}" ]]; then
      break
    else
      echo "Invalid service_id. Please try again."
    fi
  done
}

# Prompt user to pick a service
echo
echo ~~~~~ MY SALON ~~~~~
echo
pickService

# Prompt user for phone number
echo "Please enter your phone number: " 
read CUSTOMER_PHONE

# Check if the customer exists
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

if [[ ! $CUSTOMER_NAME ]]; then
  # If customer doesn't exist, prompt for name and insert into customers table
  echo "Please enter your name: "
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi

# Get the customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

# Prompt user for appointment time
echo "Please enter the appointment time: " 
read SERVICE_TIME

# Insert the appointment into the appointments table
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# Output confirmation message
SERVICE_NAME=${services_array[$SERVICE_ID_SELECTED]}
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
