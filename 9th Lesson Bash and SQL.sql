#Lean Bash and SQL by Building a Bike Rental 

/*The first thing you need to do is start the terminal. Do that by clicking the "hamburger" menu at the top left of the screen, going to the "terminal" section, and clicking "new terminal". Once you open a new one, type echo hello terminal into the terminal and press enter.*/

echo hello terminal

/*You are going to build a bike rental shop. It will have a database, and a bash script to interact with the database. Use the terminal to connect to PostgreSQL by entering psql --username=freecodecamp --dbname=postgres.*/

psql --username=freecodecamp --dbname=postgres

/*List the databases with \l to see what databases are here.*/

\l

/*You need your own database for the bike shop. Create a new database named bikes.*/

create database bikes;

/*List databases again to make sure your database got created.*/

\l

/*There it is. Connect to it so you can start building the structure of your bike shop database.*/

\c bikes

/*Your database needs three tables. One for your bike inventory, one for your customers, and one for the bikes that are rented out. Create a table named bikes in your database for the inventory.*/

create table bikes();

/*Display the tables to make sure your table got created.*/

\d

/*The table will have a few columns for bike information. First, is a unique ID column. Add a column to the bikes table named bike_id. Give it a type of SERIAL and make it a PRIMARY KEY.*/

alter table bikes add column bike_id serial primary key;

/*Use the display command to view the details of the bikes table.*/

\d bikes;

/*The first column is set. Add a column named type for the type of bike. Make it a VARCHAR(50) and give it a constraint of NOT NULL.*/

alter table bikes add column type varchar(50) not null;

/*Display the details of the bikes table again.*/

\d bikes;

/*The first two columns look good. Add a column named size to the bikes table that is an INT and has the NOT NULL constraint. This will be for the size of each bike.*/

alter table bikes add column size int not null;

/*Add another column to the table named available. Make it a boolean and has a constraint of NOT NULL. Also give it a default value of TRUE. This will be set to false when someone rents out a bike.*/

alter table bikes add column available boolean default(TRUE) not null;

/*Display the details of the bikes table again so you can make sure it's how you want it.*/

\d bikes;

/*That table is done for now. Create another table named customers. It will store a name and phone number for each customer that rents a bike.*/

create table customers();

/*Add a customer_id column to your new table that is a type of SERIAL and make it a PRIMARY KEY.*/

alter table customers add column customer_id serial primary key;

/*Display the details of the customers table so you can make sure your new column is there.*/

\d customers;

/*There it is. Add a column named phone for customers phone numbers. Make it a varying character that has a maximum length of 15 characters. Also make sure it can't be null, and that it has to be unique.*/

alter table customers add column phone varchar(15) not null unique;

/*Add the last column. Call it name and make it a VARCHAR(40) that can't be null.*/

alter table customers add column name varchar(40) not null;

/*Display the details of the customers table.*/

\d customers;

/*That table is finished. Lastly, you need a table to store which bikes are rented and who has rented them. Create a new table named rentals.*/

create table rentals();

/*Add a rental_id column to your new table. Make it automatically increment with SERIAL and make it the primary key for this table.*/

alter table rentals add column rental_id serial primary key;

/*Display the details of the rentals table.*/

\d rentals;

/*Next, you need a column for the customer who is renting a bike. Add column named customer_id. This will have an id of a customer from the customers table. Make the column an INT and NOT NULL to start.*/

alter table rentals add column customer_id int not null;

/*Make the column you just added a foreign key that references the customer_id column from the customers table. Here's an example of how you can do that:
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);*/

alter table rentals add foreign key(customer_id) references customers(customer_id);

/*Display the details of the rentals table to make sure your key is set.*/

\d rentals;

/*That foreign key is set. You need another column so you know what bike a customer is renting. Add a column named bike_id and make it an INT and NOT NULL.*/

alter table rentals add column bike_id int not null;

/*Make that column a foreign key that references the bike_id column from the bikes table so you know what bike the id is for.*/

alter table rentals add foreign key(bike_id) references bikes(bike_id);

/*Display the details of the rentals table so you can make sure the key is correct.*/

\d rentals;

/*Moving along. You want to know when a customer rents a bike, and when it gets returned. Add a column to your rentals table named date_rented that's a type of DATE. Make sure the entry can't be null, and give it a default value of NOW().*/

alter table rentals add column date_rented date default(now()) not null;

/*Display the details of the rentals table again.*/

\d rentals;

/*It looks good. Lastly, you need column for when a customer returns a bike. Add a column named date_returned that's a type of DATE.*/

alter table rentals add column date_returned date;

/*View the details of the table again.*/

\d rentals;

/*The tables are all finished. Display all the tables so you can see what you ended up with.*/

\d

/*You have nine bikes in your inventory. Add the first one to your bikes table. It has a type of Mountain and a size of 27. Make sure to put your VARCHAR values in single quotes. The bike_id and available columns should be filled in automatically, so you don't need to worry about those.*/

insert into bikes(type, size) values('Mountain', 27);

/*View all the columns in your bikes table with SELECT.*/

select * from bikes;

/*Looks like it's all working, the bike_id and available columns were filled in automatically. Insert another bike. Give it a type of Mountain and a size of 28.*/

insert into bikes(type, size) values('Mountain', 28);

/*Add another Mountain bike to your inventory. Make it a 29 inch bike.*/

insert into bikes(type, size) values('Mountain', 29);

/*Add a 27 inch Road bike to the table.*/

insert into bikes(type, size) values('Road', 27);

/*Use SELECT to view all the data in the bikes table again.*/

select * from bikes;

/*Add the two bikes to your inventory, they are 28 and 29 inch Road bikes. Try to add them both with one command.*/

insert into bikes(type, size) values('Road', 28), ('Road', 29);

/*There's three more bikes. Add 19, 20, and 21 inch BMX bikes to your table. Try to add them with one command.*/

insert into bikes(type, size) values('BMX', 19), ('BMX', 20), ('BMX', 21);

/*View all the data in your bikes table.*/

select * from bikes;

/*Your current inventory is all added. For the rest of the project, I recommend leaving that terminal open and connected, and that you should "split" the terminal so you have a second one to use for bash commands. Do that by clicking the "hamburger" menu at the top left of the window, going to the "terminal" section, and clicking "split terminal". After you have opened it, use the touch command to create a file named bike-shop.sh in the project folder.*/

touch bike-shop.sh

/*This file will be the program for your bike rental shop. Open the file and add a "shebang" at the top so it uses bash when it's executed. If you don't remember, it looks like this: #!/bin/bash.*/

#!/bin/bash

/*In the file, use echo with the -e flag to print ~~~~~ Bike Rental Shop ~~~~~ with a new line at the beginning and end.*/

echo -e "\n~~~~~ Bike Rental Shop ~~~~~\n"

/*Use the terminal (not the psql one) and the chmod command to make your file executable. Add the +x flag and bike-shop.sh to the command to do that.*/

chmod +x bike-shop.sh

/*Type ./bike-shop.sh in the terminal to run your script.*/

./bike-shop.sh

/*😄 In the script, create an empty function named MAIN_MENU. This will have a few options to enter when the script runs to rent or return a bike.*/

MAIN_MENU(){
  
}

/*In your function, echo the text How may I help you? so that there's a greeting when you go to the menu.*/

MAIN_MENU(){
  echo "How may I help you?"
}

/*Call your MAIN_MENU at the bottom of the file so the function runs when you start the script.*/

MAIN_MENU

/*Run the file in the terminal again so you can see what it is outputting.*/

./bike-shop.sh

/*It's coming along. Add another echo command in the function below the other one. Make it output text that looks like this:
1. Rent a bike
2. Return a bike
3. Exit
Note that there's an empty line at the start.*/

MAIN_MENU(){
  echo "How may I help you?"
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
}

/*Run the file to make sure it worked.*/

./bike-shop.sh

/*You have some options displaying. Next, you need to get input from whoever is using the program. Use the read command to read input into a variable called MAIN_MENU_SELECTION below the options.*/

MAIN_MENU(){
  echo "How may I help you?"
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
  read MAIN_MENU_SELECTION
}

/*When an option gets entered, you need to take a user to one of those other menus. Add an empty RENT_MENU function below the MAIN_MENU function.*/

RENT_MENU(){
  
}

/*For the time being, just echo Rent Menu in the function so you can see if it's working.*/

RENT_MENU(){
  echo "Rent Menu"
}

/*Add an empty RETURN_MENU function below the RENT_MENU function for when a user enters the option to return a bike.*/

RETURN_MENU(){
  
}

/*Use echo to print Return Menu in the function you just added. You will change these later.*/

RETURN_MENU(){
  echo "Return Menu"
}

/*Add an empty EXIT function below the RETURN_MENU function for when a user wants to exit the program.*/

EXIT(){

}

/*This one probably doesn't need a placeholder message. In the EXIT function, use echo to print Thank you for stopping in. with a new line at the beginning and end of the message.*/

EXIT(){
   echo -e "\nThank you for stopping in.\n"
}

/*When a user enters an option at the main menu, you want to take them to the appropriate sub-menu. You can use a case statement for this. Here's an example:
case EXPRESSION in
  PATTERN) STATEMENTS ;;
  PATTERN) STATEMENTS ;;
  PATTERN) STATEMENTS ;;
  *) STATEMENTS ;;
esac
The expression you want is the $MAIN_MENU_SELECTION variable. You are expecting it to be a 1, 2, or 3 for your various menus. Add a case statement that takes users to their corresponding menus. The * is for when anything else is entered. Take users to the MAIN_MENU when the variable isn't a 1, 2, or 3.*/

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

/*Run the script a few times and try out the different menus. Be sure to enter something other than one of the options to go to the main menu.*/

./bike-shop.sh

/*Add an argument to where you call MAIN_MENU in the case statement. It should be Please enter a valid option.. The next step will adjust the function so the message is printed when a user enters an invalid option.*/

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

/*At the top of the MAIN_MENU function, add an if condition that checks if there's an argument ($1) passed to the function. If there is, print the message with a new line in front of it.*/

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

/*Run the script and enter an invalid option to see the message. Exit the program when you are done.*/

./bike-shop.sh

/*Looks good. Delete the echo "Rent Menu" from the RENT_MENU function so you can start adding the ability to rent a bike from the database.*/

RENT_MENU(){
  
}

/*In the RENT_MENU function, add three single line comments; get available bikes, if no bikes available, and send to main menu, in that order.*/

RENT_MENU(){
  #get available bikes
  #if no bikes available
  #send to main menu
}

/*To get the bikes available, you need to query the database from your script. Below the "shebang", add a PSQL variable that looks like this: PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c". You will then be able to use it to query the database like this: $($PSQL "<query_here>").*/