#World Cup Database

/*Instructions
Follow the instructions and get all the user stories below to pass to finish the project.

You start with several files, one of them is games.csv. It contains a comma-separated list of all games of the final three rounds of the World Cup tournament since 2014; the titles are at the top. It includes the year of each game, the round of the game, the winner, their opponent, and the number of goals each team scored. You need to do three things for this project:

Part 1: Create the database

Log into the psql interactive terminal with psql --username=freecodecamp --dbname=postgres and create your database structure according to the user stories below.

Don't forget to connect to the database after you create it.

Part 2: Insert the data

Complete the insert_data.sh script to correctly insert all the data from games.csv into the database. The file is started for you. Do not modify any of the code you start with. Using the PSQL variable defined, you can make database queries like this: $($PSQL "<query_here>"). The tests have a 20 second limit, so try to make your script efficient. The less you have to query the database, the faster it will be. You can empty the rows in the tables of your database with TRUNCATE TABLE games, teams;

Part 3: Query the database

Complete the empty echo commands in the queries.sh file to produce output that matches the expected_output.txt file. The file has some starter code, and the first query is completed for you. Use the PSQL variable defined to complete rest of the queries. Note that you need to have your database filled with the correct data from the script to get the correct results from your queries. Hint: Test your queries in the psql prompt first and then add them to the script file.

Notes:
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql in a bash terminal (not the psql one). It will save the commands to rebuild your database in worldcup.sql. The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering psql -U postgres < worldcup.sql in a terminal where the .sql file is.

If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the worldcup.sql file, as well as the final version of your insert_data.sh and queries.sh files, in a public repository and submit the URL to it on freeCodeCamp.org.

Complete the tasks below

You should create a database named worldcup

You should connect to your worldcup database and then create teams and games tables

Your teams table should have a team_id column that is a type of SERIAL and is the primary key, and a name column that has to be UNIQUE

Your games table should have a game_id column that is a type of SERIAL and is the primary key, a year column of type INT, and a round column of type VARCHAR

Your games table should have winner_id and opponent_id foreign key columns that each reference team_id from the teams table

Your games table should have winner_goals and opponent_goals columns that are type INT

All of your columns should have the NOT NULL constraint

Your two script (.sh) files should have executable permissions. Other tests involving these two files will fail until permissions are correct. When these permissions are enabled, the tests will take significantly longer to run

When you run your insert_data.sh script, it should add each unique team to the teams table. There should be 24 rows

When you run your insert_data.sh script, it should insert a row for each line in the games.csv file (other than the top line of the file). There should be 32 rows. Each row should have every column filled in with the appropriate info. Make sure to add the correct ID's from the teams table (you cannot hard-code the values)

You should correctly complete the queries in the queries.sh file. Fill in each empty echo command to get the output of what is suggested with the command above it. Only use a single line like the first query. The output should match what is in the expected_output.txt file exactly, take note of the number of decimal places in some of the query results*/

/*PSQL commands*/

psql --username=freecodecamp --dbname=postgres

create database worldcup;

\c worldcup

create table teams(team_id serial not null primary key, name varchar not null unique);

create table games(game_id serial not null primary key, year int not null, round varchar not null, winner_id int not null, opponent_id int not null, winner_goals int not null, opponent_goals int not null, foreign key(winner_id) references teams(team_id), foreign key(opponent_id) references teams(team_id));

/*insert_data.sh*/

chmod +x insert_data.sh

echo $($PSQL "truncate teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    TEAM1_NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM1_NAME ]]
    then
      INSERT_TEAM1_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi
  fi
  if [[ $OPPONENT != "opponent" ]]
  then
    TEAM2_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM2_NAME ]]
    then
      INSERT_TEAM2_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi
  fi
  if [[ YEAR != "year" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done

/*queries.sh*/

chmod +x queries.sh

#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL"select sum(winner_goals + opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL"select avg(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL"select round(avg(winner_goals), 2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL"select avg(winner_goals + opponent_goals) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL"select max(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL"select count(*) from games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL"select name from teams inner join games on teams.team_id = games.winner_id where year = 2018 and round = 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL"select name from teams left join games on teams.team_id = games.winner_id or teams.team_id = games.opponent_id where year = 2014 and round = 'Eighth-Final' order by name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL"select distinct(name) from teams inner join games on teams.team_id = games.winner_id order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL"select year, name from games inner join teams on games.winner_id = teams.team_id where round = 'Final' order by year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL"select name from teams where name like 'Co%'")"


psql --username=freecodecamp --dbname=worldcup

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]
  then
    TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_NAME_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
      WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    fi
  fi
  if [[ $OPPONENT != opponent ]]
  then
    TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_NAME_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
      OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    fi
    INSERT_GAMES_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done
