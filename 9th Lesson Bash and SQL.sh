#Lean Bash and SQL by Building a Bike Rental 

#The first thing you need to do is start the terminal. Do that by clicking the "hamburger" menu at the top left of the screen, going to the "terminal" section, and clicking "new terminal". Once you open a new one, type echo hello terminal into the terminal and press enter.

echo hello terminal

#You are going to build a bike rental shop. It will have a database, and a bash script to interact with the database. Use the terminal to connect to PostgreSQL by entering psql --username=freecodecamp --dbname=postgres.

psql --username=freecodecamp --dbname=postgres

#List the databases with \l to see what databases are here.

\l

#You need your own database for the bike shop. Create a new database named bikes.

create database bikes;

#List databases again to make sure your database got created.

\l

#There it is. Connect to it so you can start building the structure of your bike shop database.

\c bikes

#Your database needs three tables. One for your bike inventory, one for your customers, and one for the bikes that are rented out. Create a table named bikes in your database for the inventory.

create table bikes();

#Display the tables to make sure your table got created.

\d

#The table will have a few columns for bike information. First, is a unique ID column. Add a column to the bikes table named bike_id. Give it a type of SERIAL and make it a PRIMARY KEY.

alter table bikes add column bike_id serial primary key;

#Use the display command to view the details of the bikes table.

\d bikes;

#The first column is set. Add a column named type for the type of bike. Make it a VARCHAR(50) and give it a constraint of NOT NULL.

alter table bikes add column type varchar(50) not null;

#Display the details of the bikes table again.

\d bikes;

#The first two columns look good. Add a column named size to the bikes table that is an INT and has the NOT NULL constraint. This will be for the size of each bike.

alter table bikes add column size int not null;

#Add another column to the table named available. Make it a boolean and has a constraint of NOT NULL. Also give it a default value of TRUE. This will be set to false when someone rents out a bike.

alter table bikes add column available boolean default(TRUE) not null;

#Display the details of the bikes table again so you can make sure it's how you want it.

\d bikes;

#That table is done for now. Create another table named customers. It will store a name and phone number for each customer that rents a bike.

create table customers();

#Add a customer_id column to your new table that is a type of SERIAL and make it a PRIMARY KEY.

alter table customers add column customer_id serial primary key;

#Display the details of the customers table so you can make sure your new column is there.

\d customers;

#There it is. Add a column named phone for customers phone numbers. Make it a varying character that has a maximum length of 15 characters. Also make sure it can't be null, and that it has to be unique.

alter table customers add column phone varchar(15) not null unique;

#Add the last column. Call it name and make it a VARCHAR(40) that can't be null.

alter table customers add column name varchar(40) not null;

#Display the details of the customers table.

\d customers;

#That table is finished. Lastly, you need a table to store which bikes are rented and who has rented them. Create a new table named rentals.

create table rentals();

#Add a rental_id column to your new table. Make it automatically increment with SERIAL and make it the primary key for this table.

alter table rentals add column rental_id serial primary key;

#Display the details of the rentals table.

\d rentals;

#Next, you need a column for the customer who is renting a bike. Add column named customer_id. This will have an id of a customer from the customers table. Make the column an INT and NOT NULL to start.

alter table rentals add column customer_id int not null;

#Make the column you just added a foreign key that references the customer_id column from the customers table. Here's an example of how you can do that:
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);

alter table rentals add foreign key(customer_id) references customers(customer_id);

#Display the details of the rentals table to make sure your key is set.

\d rentals;

#That foreign key is set. You need another column so you know what bike a customer is renting. Add a column named bike_id and make it an INT and NOT NULL.

alter table rentals add column bike_id int not null;

#Make that column a foreign key that references the bike_id column from the bikes table so you know what bike the id is for.

alter table rentals add foreign key(bike_id) references bikes(bike_id);

#Display the details of the rentals table so you can make sure the key is correct.

\d rentals;

#Moving along. You want to know when a customer rents a bike, and when it gets returned. Add a column to your rentals table named date_rented that's a type of DATE. Make sure the entry can't be null, and give it a default value of NOW().

alter table rentals add column date_rented date default(now()) not null;

#Display the details of the rentals table again.

\d rentals;

#It looks good. Lastly, you need column for when a customer returns a bike. Add a column named date_returned that's a type of DATE.

alter table rentals add column date_returned date;

#View the details of the table again.

\d rentals;

#The tables are all finished. Display all the tables so you can see what you ended up with.

\d

#You have nine bikes in your inventory. Add the first one to your bikes table. It has a type of Mountain and a size of 27. Make sure to put your VARCHAR values in single quotes. The bike_id and available columns should be filled in automatically, so you don't need to worry about those.

insert into bikes(type, size) values('Mountain', 27);

#View all the columns in your bikes table with SELECT.

select * from bikes;

#Looks like it's all working, the bike_id and available columns were filled in automatically. Insert another bike. Give it a type of Mountain and a size of 28.

insert into bikes(type, size) values('Mountain', 28);

#Add another Mountain bike to your inventory. Make it a 29 inch bike.

insert into bikes(type, size) values('Mountain', 29);

#Add a 27 inch Road bike to the table.

insert into bikes(type, size) values('Road', 27);

#Use SELECT to view all the data in the bikes table again.

select * from bikes;

#Add the two bikes to your inventory, they are 28 and 29 inch Road bikes. Try to add them both with one command.

insert into bikes(type, size) values('Road', 28), ('Road', 29);

#There's three more bikes. Add 19, 20, and 21 inch BMX bikes to your table. Try to add them with one command.

insert into bikes(type, size) values('BMX', 19), ('BMX', 20), ('BMX', 21);

#View all the data in your bikes table.

select * from bikes;

#Your current inventory is all added. For the rest of the project, I recommend leaving that terminal open and connected, and that you should "split" the terminal so you have a second one to use for bash commands. Do that by clicking the "hamburger" menu at the top left of the window, going to the "terminal" section, and clicking "split terminal". After you have opened it, use the touch command to create a file named bike-shop.sh in the project folder.

touch bike-shop.sh

#This file will be the program for your bike rental shop. Open the file and add a "shebang" at the top so it uses bash when it's executed. If you don't remember, it looks like this: #!/bin/bash.

#!/bin/bash

#In the file, use echo with the -e flag to print ~~~~~ Bike Rental Shop ~~~~~ with a new line at the beginning and end.

echo -e "\n~~~~~ Bike Rental Shop ~~~~~\n"

#Use the terminal (not the psql one) and the chmod command to make your file executable. Add the +x flag and bike-shop.sh to the command to do that.

chmod +x bike-shop.sh

#Type ./bike-shop.sh in the terminal to run your script.

./bike-shop.sh

#😄 In the script, create an empty function named MAIN_MENU. This will have a few options to enter when the script runs to rent or return a bike.

MAIN_MENU(){
  
}

#In your function, echo the text How may I help you? so that there's a greeting when you go to the menu.

MAIN_MENU(){
  echo "How may I help you?"
}

#Call your MAIN_MENU at the bottom of the file so the function runs when you start the script.

MAIN_MENU

#Run the file in the terminal again so you can see what it is outputting.

./bike-shop.sh

#It's coming along. Add another echo command in the function below the other one. Make it output text that looks like this:
#1. Rent a bike
#2. Return a bike
#3. Exit
#Note that there's an empty line at the start.

MAIN_MENU(){
  echo "How may I help you?"
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
}

#Run the file to make sure it worked.

./bike-shop.sh

#You have some options displaying. Next, you need to get input from whoever is using the program. Use the read command to read input into a variable called MAIN_MENU_SELECTION below the options.

MAIN_MENU(){
  echo "How may I help you?"
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
  read MAIN_MENU_SELECTION
}

#When an option gets entered, you need to take a user to one of those other menus. Add an empty RENT_MENU function below the MAIN_MENU function.

RENT_MENU(){
  
}

#For the time being, just echo Rent Menu in the function so you can see if it's working.

RENT_MENU(){
  echo "Rent Menu"
}

#Add an empty RETURN_MENU function below the RENT_MENU function for when a user enters the option to return a bike.

RETURN_MENU(){
  
}

#Use echo to print Return Menu in the function you just added. You will change these later.

RETURN_MENU(){
  echo "Return Menu"
}

#Add an empty EXIT function below the RETURN_MENU function for when a user wants to exit the program.

EXIT(){

}

#This one probably doesn't need a placeholder message. In the EXIT function, use echo to print Thank you for stopping in. with a new line at the beginning and end of the message.

EXIT(){
   echo -e "\nThank you for stopping in.\n"
}

#When a user enters an option at the main menu, you want to take them to the appropriate sub-menu. You can use a case statement for this. Here's an example:
case EXPRESSION in
  PATTERN) STATEMENTS ;;
  PATTERN) STATEMENTS ;;
  PATTERN) STATEMENTS ;;
  *) STATEMENTS ;;
esac

#The expression you want is the $MAIN_MENU_SELECTION variable. You are expecting it to be a 1, 2, or 3 for your various menus. Add a case statement that takes users to their corresponding menus. The * is for when anything else is entered. Take users to the MAIN_MENU when the variable isn't a 1, 2, or 3.

MAIN_MENU(){
  echo "How may I help you?"
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
  read MAIN_MENU_SELECTION
  case $MAIN_MENU_SELECTION in
    1) RENT_MENU ;;
    2) RETURN_MENU ;;
    3) EXIT ;;
    *) MAIN_MENU ;;
  esac
}

#Run the script a few times and try out the different menus. Be sure to enter something other than one of the options to go to the main menu.

./bike-shop.sh

#Add an argument to where you call MAIN_MENU in the case statement. It should be Please enter a valid option.. The next step will adjust the function so the message is printed when a user enters an invalid option.

MAIN_MENU(){
  echo "How may I help you?"
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
  read MAIN_MENU_SELECTION
  case $MAIN_MENU_SELECTION in
    1) RENT_MENU ;;
    2) RETURN_MENU ;;
    3) EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

#At the top of the MAIN_MENU function, add an if condition that checks if there's an argument ($1) passed to the function. If there is, print the message with a new line in front of it.

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo "How may I help you?"
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
  read MAIN_MENU_SELECTION
  case $MAIN_MENU_SELECTION in
    1) RENT_MENU ;;
    2) RETURN_MENU ;;
    3) EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

#Run the script and enter an invalid option to see the message. Exit the program when you are done.

./bike-shop.sh

#Looks good. Delete the echo "Rent Menu" from the RENT_MENU function so you can start adding the ability to rent a bike from the database.

RENT_MENU(){
  
}

#In the RENT_MENU function, add three single line comments; get available bikes, if no bikes available, and send to main menu, in that order.

RENT_MENU(){
  #get available bikes
  #if no bikes available
  #send to main menu
}

#To get the bikes available, you need to query the database from your script. Below the "shebang", add a PSQL variable that looks like this: PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c". You will then be able to use it to query the database like this: $($PSQL "<query_here>").

PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c"

#Below the get available bikes comment. Create an AVAILABLE_BIKES variable that gets the bike_id, type, and size columns from the bikes table for the bikes that are available. Order the results by their bike_id column. Here's an example: AVAILABLE_BIKES=$($PSQL "<query_here>")

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  # if no bikes available

  # send to main menu
  
}

#Below the new variable, use echo to print it. Place it in double quotes so it prints any new lines.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  echo "$AVAILABLE_BIKES"
  # if no bikes available

  # send to main menu
  
}

#Run your script and go to the rent menu to see if the available bikes are being printed.

./bike-shop.sh

#Awesome. In the psql prompt, set the available column to false for all the bikes so you can see what it prints when there's no bikes available.

update bikes set available = false;

#Run your script and go to the rent menu to see the output.

./bike-shop.sh

#So if there's no bike available, the variable will be empty. In the script, below the if no bikes available comment, add an if condition that checks if the variable is empty. Use -z to check if it's empty. Place the send to main menu comment in its STATEMENTS area.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  echo "$AVAILABLE_BIKES"
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
  fi
}

#Below the comment in the if you just added. Send users to the main menu and give them the message, Sorry, we don't have any bikes available right now.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  echo "$AVAILABLE_BIKES"
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  fi
}

#Run the script and go to the rent menu to see the message. When you are done, exit the program.

./bike-shop.sh

#If no bikes are available, you will get that message. Add an else to the if condition for when there is bikes available. In it, add four single line comments; display available bikes, ask for bike to rent, if input is not a number, and send to main menu.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  echo "$AVAILABLE_BIKES"
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    #ask for bike to rent
    #if input is not a number
    #send to main menu
  fi
}

#Below the display available bikes comment you just added, use echo to print Here are the bikes we have available: with a new line in front of the message

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  echo "$AVAILABLE_BIKES"
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    echo -e "\nHere are the bikes we have available:"
    #ask for bike to rent
    #if input is not a number
    #send to main menu
  fi
}

#Move the echo command that prints all the available bikes below the message you just added.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES"
    #ask for bike to rent
    #if input is not a number
    #send to main menu
  fi
}

#In the psql prompt, set all the bikes, except for the BMX bikes, back to true so you can see a list of bikes to rent.

update bikes set available = true where type = 'Mountain' or type = 'Road';

#Run the script and go to the rent menu to see the list of bikes available.

./bike-shop.sh

#Instead of directly printing the list, pipe the output into a while loop that reads each line. Here's how that looks:
echo "$AVAILABLE_BIKES" | while read <VAR_1> <VAR_2> <VAR_3> <VAR_4> <VAR_5>
do
  <STATEMENTS>
done
It will read the first line of your AVAILABLE_BIKES variable into the five variables. Each variable being the next word in the line. Read each line into variables, BIKE_ID BAR TYPE BAR SIZE. In the <STATEMENTS> area, use echo to print the BIKE_ID, TYPE, and SIZE variables, in that order.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo $BIKE_ID $TYPE $SIZE
    done
    #ask for bike to rent
    #if input is not a number
    #send to main menu
  fi
}

#Run the script and go to the rent menu again to see if it's working.

./bike-shop.sh

#It's working 😄 Adjust the echo command that prints the bike info so that the first line printed would look like this: 1) 27" Mountain Bike. The rest would look the same, but with their bike info. Make sure to escape any characters you need to.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done
    #ask for bike to rent
    #if input is not a number
    #send to main menu
  fi
}

#Run the script and go to the rent menu again to see what it looks like now.

./bike-shop.sh

#That's better. Below the ask for bike to rent comment, print Which one would you like to rent? with a new line in front of it.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done
    #ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    #if input is not a number
    #send to main menu
  fi
}

#Just below that, add a command to read input into a variable named BIKE_ID_TO_RENT.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done
    #ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT
    #if input is not a number
    #send to main menu
  fi
}

#Next, you want to find out how to test if the user input is a number. In the terminal, enter [[ a =~ [0-9] ]]; echo $? to see if a is a number. The conditional expression will run, and echo $? will print the exit code of it (the last command).

[[ a =~ [0-9] ]]; echo $?

#It printed 1 for false. Meaning that a did not match the pattern [0-9], or a did not contain a number from 0-9. Enter the same commands, but check if a1 matches the pattern.

[[ a1 =~ [0-9] ]]; echo $?

#That printed 0 for true. a1 does contain a number from 0-9. Enter the same command, but change the pattern to ^[0-9]$. The ^ signifies the start of the pattern, and $ means the end. So the input will have to start, contain a number 0-9, and end.

[[ a1 =~ ^[0-9]$ ]]; echo $?

#1 for false. a1 does not match the pattern. Using the same syntax, check if 1 matches the pattern.

[[ 1 =~ ^[0-9]$ ]]; echo $?

#1 does match the pattern. It starts, contains a number, and ends. Check if 11 matches the same pattern.

[[ 11 =~ ^[0-9]$ ]]; echo $?

#That did not match because the pattern only allows a single number. Add a + after the [0-9] to allow any strings that start, contain one or more numbers, and end.

[[ 11 =~ ^[0-9]+$ ]]; echo $?

#So that pattern will match any positive integers. You want to check if the input is not a number. Add ! in front of the comparison of the previous command to do that.

[[ ! 11 =~ ^[0-9]+$ ]]; echo $?

#Back in your script, below the if input is not a number comment, add an if condition that checks if the input is not a number using the method you just practiced. Add the send to main menu comment in the then area of the if.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "select bike_id, type, size from bikes where available = true order by bike_id")
  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done
    #ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT
    #if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      #send to main menu
    fi
  fi
}

#If the $BIKE_ID_TO_RENT variable is not a number, add the code to send users to the main menu with the message, That is not a valid bike number.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    fi
  fi
}

#Run the script, go to the rent menu, and enter something that isn't a number to make sure it is working. When you are done, exit the program.

./bike-shop.sh

#Add an else area for when the input is a number. Add these three single line comments in it; get bike availability, if not available, send to main menu.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      #if not available
      #send to main menu
    fi
  fi
}

#Below the get bike availability comment you just added, create a BIKE_AVAILABILITY variable. Set it equal to a query that gets the available column from the bikes table for the input. Also, make sure to only get the row if it is available.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      #send to main menu
    fi
  fi
}

#Right below the variable you just created, use echo to print it so you can see what it looks like.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      echo $BIKE_AVAILABILITY
      #if not available
      #send to main menu
    fi
  fi
}

#Run the script a few times, go to the rent menu, enter a bike that is available and one that isn't. You should have some BMX bikes that aren't available.

./bike-shop.sh

#The variable will be t or empty. Below the if not available comment, add an if condition that checks if it's empty. Put the send to main menu comment in it's statements area.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      echo $BIKE_AVAILABILITY
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
      fi
    fi
  fi
}

#In the if condition you just added, send users to the main menu with the message That bike is not available. if they input a number that isn't available.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      echo $BIKE_AVAILABILITY
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      fi
    fi
  fi
}

#Remove the line where you print the BIKE_AVAILABILITY variable. You don't need it anymore.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      fi
    fi
  fi
}

#Run the script and go to the rent menu, enter a bike that isn't available to make sure it's working. When you are done, exit the program.

./bike-shop.sh

#In the psql prompt, set all the bikes availability back to true.

update bikes set available = true;

#In your script, add an else for when a bike is available. Add these four comments in the else area get customer info, if customer doesn't exist, get new customer name, and insert new customer.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        #if customer doesn't exist
        #get new customer name
        #insert new customer
      fi
    fi
  fi
}

#As the comments say, you need to get the customer info and find out if they are an existing customer. Below the get customer info comment, print What's your phone number? with a new line in front of it.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        #if customer doesn't exist
        #get new customer name
        #insert new customer
      fi
    fi
  fi
}

#Below the line you just printed, read input into a PHONE_NUMBER variable. Since the phone number is unique, you can use it to identify a customer.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER
        #if customer doesn't exist
        #get new customer name
        #insert new customer
      fi
    fi
  fi
}

#With the customer's phone number, you can get their name. Below where you get the phone number, create a CUSTOMER_NAME variable that gets the customers name from the database using the phone number.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER
        CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$PHONE_NUMBER'")
        #if customer doesn't exist
        #get new customer name
        #insert new customer
      fi
    fi
  fi
}

#If the customer is in the database with the phone number used, the variable will be set to the name. If not, it will be empty. Add an if condition below the if customer doesn't exist comment that checks if the variable is empty. Place the next two comments in the then area.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER
        CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$PHONE_NUMBER'")
        #if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          #get new customer name
          #insert new customer
        fi
      fi
    fi
  fi
}

#If the customer isn't in the database, you need to get their name so you can add them. Below the get new customer name comment, print What's your name? with a new line in front of the message.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER
        CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$PHONE_NUMBER'")
        #if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          #get new customer name
          echo -e "\nWhat's your name?"
          #insert new customer
        fi
      fi
    fi
  fi
}

#Below the question you just printed, read input into a variable named CUSTOMER_NAME.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER
        CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$PHONE_NUMBER'")
        #if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          #get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          #insert new customer
        fi
      fi
    fi
  fi
}

#You have the two pieces of information you need. Below the insert new customer comment, create an INSERT_CUSTOMER_RESULT variable that inserts the customer into the database.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "select available from bikes where bike_id = $BIKE_ID_TO_RENT and available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER
        CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$PHONE_NUMBER'")
        #if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          #get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          #insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone, name) values('$PHONE_NUMBER', '$CUSTOMER_NAME')")
        fi
      fi
    fi
  fi
}

#Run your script and go to the rent menu. Pick a bike to rent, then enter 555-5555 when it asks for a phone number, and Me when it asks for your name.

./bike-shop.sh

#That should have added a new customer to the database. In the psql prompt, view all the data in the customers table to see if it's working.

select * from customers;

#Excellent. View all the data in the rentals table.

select * from rentals;

#So you still need to add the rental to the rentals table when a bike is picked out. View all the data in the bikes table.

select * from bikes;

#And set the available column to false for the bike rented. Below the end of the if statement that inserts a new customer, add five more comments; get customer_id, insert bike rental, set bike availability to false, get bike info, and send to main menu

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      # get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      # if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        # send to main menu
        MAIN_MENU "That bike is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]
          then
            # get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi
          # get customer_id
          # insert bike rental
          # set bike availability to false
          # get bike info
          # send to main menu
      fi
    fi
  fi
}

#You're getting close to done with the rent functionality. To add a rental to the database, you need the customer ID. Below the get customer_id comment, create a CUSTOMER_ID variable that gets the customer_id using the phone number.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      # get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      # if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        # send to main menu
        MAIN_MENU "That bike is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]
          then
            # get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi
          # get customer_id
          CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$PHONE_NUMBER'")
          # insert bike rental
          # set bike availability to false
          # get bike info
          # send to main menu
      fi
    fi
  fi
}

#Now that you have the bike ID and customer ID, you can add the rental to the database. Below the insert bike rental comment, create a INSERT_RENTAL_RESULT variable that adds the rental to the database.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      # get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      # if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        # send to main menu
        MAIN_MENU "That bike is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]
          then
            # get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi
          # get customer_id
          CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$PHONE_NUMBER'")
          # insert bike rental
          INSERT_RENTAL_RESULT=$($PSQL "insert into rentals(bike_id, customer_id) values($BIKE_ID_TO_RENT, $CUSTOMER_ID)")
          # set bike availability to false
          # get bike info
          # send to main menu
      fi
    fi
  fi
}

#That should add the rental to the database. The last thing to do is set available to false for the bike. Below the set bike availability to false comment, create a SET_TO_FALSE_RESULT variable that does that.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      # get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      # if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        # send to main menu
        MAIN_MENU "That bike is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]
          then
            # get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi
          # get customer_id
          CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$PHONE_NUMBER'")
          # insert bike rental
          INSERT_RENTAL_RESULT=$($PSQL "insert into rentals(bike_id, customer_id) values($BIKE_ID_TO_RENT, $CUSTOMER_ID)")
          # set bike availability to false
          SET_TO_FALSE_RESULT=$($PSQL "update bikes set available = false where bike_id = $BIKE_ID_TO_RENT")
          # get bike info
          # send to main menu
      fi
    fi
  fi
}

#Run the script and go to the rent menu. Pick the first bike on the list and enter 555-5555 when it asks for a phone number again. That phone number should already be in the database, so it won't ask for a name or insert a customer.

./bike-shop.sh

#In the psql prompt, view all the data in the rentals table. There should be a new rental.

select * from rentals;

#The rental was added and the date_rented was filled in automatically. 😄 Next, view all the data in the bikes table. Order the results by bike_id

select * from bikes order by bike_id;

#The available column was set to false for the bike you rented. The last thing to do is give a nice message about the rental. Below the get bike info comment, create a BIKE_INFO variable that gets the size and type, in that order, of the bike rented.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      # get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      # if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        # send to main menu
        MAIN_MENU "That bike is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]
          then
            # get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi
          # get customer_id
          CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$PHONE_NUMBER'")
          # insert bike rental
          INSERT_RENTAL_RESULT=$($PSQL "insert into rentals(bike_id, customer_id) values($BIKE_ID_TO_RENT, $CUSTOMER_ID)")
          # set bike availability to false
          SET_TO_FALSE_RESULT=$($PSQL "update bikes set available = false where bike_id = $BIKE_ID_TO_RENT")
          # get bike info
          BIKE_INFO=$($PSQL "select size, type from bikes where bike_id = $BIKE_ID_TO_RENT")
          # send to main menu
      fi
    fi
  fi
}

#Below the variable you just created, use echo to print it.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      # get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      # if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        # send to main menu
        MAIN_MENU "That bike is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]
          then
            # get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi
          # get customer_id
          CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$PHONE_NUMBER'")
          # insert bike rental
          INSERT_RENTAL_RESULT=$($PSQL "insert into rentals(bike_id, customer_id) values($BIKE_ID_TO_RENT, $CUSTOMER_ID)")
          # set bike availability to false
          SET_TO_FALSE_RESULT=$($PSQL "update bikes set available = false where bike_id = $BIKE_ID_TO_RENT")
          # get bike info
          BIKE_INFO=$($PSQL "select size, type from bikes where bike_id = $BIKE_ID_TO_RENT")
          echo $BIKE_INFO
          # send to main menu
      fi
    fi
  fi
}

#Run the script again and go to the rent menu, there should now be one less bike displayed. Pick the next bike on the list and rent it using the customer with phone number 555-5555 again so you can see the variable.

./bike-shop.sh

#It should have printed 28 | Mountain. The message you want to print after someone rents a bike would have said I have put you down for the 28" Mountain Bike, Me.. You need to format that variable for the message. The sed command can be used to replace characters and patterns in text. It looks like this: sed s/<regex_pattern_to_replace>/<characters_to_replace_with>/<regex_flags>. In the terminal, enter echo '28 | Mountain' | sed 's/ /=/g' to practice.

echo '28 | Mountain' | sed 's/ /=/g'

#The command you used, "piped" a string (28 | Mountain) to the sed command, where it replaced all the spaces with =. Enter the same command, but replace all the spaces with nothing.

echo '28 | Mountain' | sed 's/ //g'

#The g regex flag stands for "global". It will replace all instance of the pattern. In this case, it replaced all the spaces. Enter the same command but without that flag.

echo '28 | Mountain' | sed 's/ //'

#That time, only the first instance of the pattern was replaced. The first space was removed. Enter the same command, but replace the first instance of  | (<space>|) with nothing.

echo '28 | Mountain' | sed 's/ |//'

#Enter the same command, but make the output look like how you want in the message, 28" Mountain.

echo '28 | Mountain' | sed 's/ |/"/'

#Back in your script, where you echo the BIKE_INFO, pipe the output into a sed command that replaces  | (<space>|) with " so the text will read <SIZE>" <TYPE>. 28 | Mountain would become 28" Mountain, for instance.

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      # get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      # if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        # send to main menu
        MAIN_MENU "That bike is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]
          then
            # get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi
          # get customer_id
          CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$PHONE_NUMBER'")
          # insert bike rental
          INSERT_RENTAL_RESULT=$($PSQL "insert into rentals(bike_id, customer_id) values($BIKE_ID_TO_RENT, $CUSTOMER_ID)")
          # set bike availability to false
          SET_TO_FALSE_RESULT=$($PSQL "update bikes set available = false where bike_id = $BIKE_ID_TO_RENT")
          # get bike info
          BIKE_INFO=$($PSQL "select size, type from bikes where bike_id = $BIKE_ID_TO_RENT")
          echo $BIKE_INFO | sed 's/ |/"/'
          # send to main menu
      fi
    fi
  fi
}

#Run the script and rent another bike using the customer with phone number 555-5555 again. Make sure the bike info printed looks like you want.

./bike-shop.sh

#Now it is formatted for the message. Take that echo command and the part that formats it, put it in a sub shell, and set the output into a variable named BIKE_INFO_FORMATTED. Here's an example: BIKE_INFO_FORMATTED=$(<formatted info here>)

RENT_MENU() {
  # get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")

  # if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    # display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done

    # ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT

    # if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      # get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")

      # if not available
      if [[ -z $BIKE_AVAILABILITY ]]
      then
        # send to main menu
        MAIN_MENU "That bike is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

          if [[ -z $CUSTOMER_NAME ]]
          then
            # get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$PHONE_NUMBER')")
          fi
          # get customer_id
          CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$PHONE_NUMBER'")
          # insert bike rental
          INSERT_RENTAL_RESULT=$($PSQL "insert into rentals(bike_id, customer_id) values($BIKE_ID_TO_RENT, $CUSTOMER_ID)")
          # set bike availability to false
          SET_TO_FALSE_RESULT=$($PSQL "update bikes set available = false where bike_id = $BIKE_ID_TO_RENT")
          # get bike info
          BIKE_INFO=$($PSQL "select size, type from bikes where bike_id = $BIKE_ID_TO_RENT")
          BIKE_INFO_FORMATTED=$(echo $BIKE_INFO | sed 's/ |/"/')
          # send to main menu
      fi
    fi
  fi
}

