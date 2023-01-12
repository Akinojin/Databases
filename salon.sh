#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ Salon Scheduler ~~~\n"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # get available services
  SERVICES=$($PSQL "SELECT * FROM services")

  # list available services
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # select a service
  echo -e "\nWhich services would you like to use?"
  read SERVICE_ID_SELECTED

  # if not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Please enter a number of service you would like to make an appointment for."
  else
    SERVICE_EXISTS=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
    # if service does not exist
    if [[ -z $SERVICE_EXISTS ]]
    then
      MAIN_MENU "Such service does not exist. Please choose another service."
    else
      # get customer phone
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      # check if customer is in database
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      if [[ -z $CUSTOMER_NAME ]]
      then
        # get customer name
        echo -e "\nYou have not visited us yet. Please provide your name:\n"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        echo -e "\nWelcome, $CUSTOMER_NAME!"
      else
        # greet the customer
        echo -e "\nWelcome back, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')!"
      fi
    fi
  fi
  
  # request the time of the appointment
  echo "Please enter the preferred time of the appointment:"
  read SERVICE_TIME

  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # make a note in the appointments
  INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # get servie name
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  exit
}

MAIN_MENU
