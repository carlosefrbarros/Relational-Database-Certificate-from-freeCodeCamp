#Learn Relational Databases by Building a Mario Database

/*The first thing you need to do is start the terminal. Do that by clicking the "hamburger" menu at the top left of the screen, going to the "terminal" section, and clicking "new terminal". Once you open a new one, type echo hello PostgreSQL into the terminal and press enter.*/

echo hello PostgreSQL

/*Your virtual machine comes with PostgreSQL installed. You will use the Psql terminal application to interact with it. Log in by typing psql --username=freecodecamp --dbname=postgres into the terminal and pressing enter.*/

psql --username=freecodecamp --dbname=postgres

/*Notice that the prompt changed to let you know that you are now interacting with PostgreSQL. First thing to do is see what databases are here. Type \l into the prompt to list them.*/

\l

/*The databases you see are there by default. You can make your own like this:
CREATE DATABASE database_name;
The capitalized words are keywords telling PostgreSQL what to do. The name of the database is the lowercase word. Note that all commands need a semi-colon at the end. Create a new database named first_database.*/

create database first_database;

#Use the list shortcut command again to make sure your new database is there.

\l

/*It worked. Your new database is there. If you don't get a message after entering a command, it means it's incomplete and you likely forgot the semi-colon. You can just add it on the next line and press enter to finish the command. Create another database named second_database.*/

create database second_database;

/*You should have another new database now. List the databases to make sure.*/

\l

/*You can connect to a database by entering \c database_name. You need to connect to add information. Connect to your second_database.*/

\c second_database;

/*You should see a message that you are connected. Notice that the prompt changed to second_database=>. So the postgres=> prompt before must have meant you were connected to that database. A database is made of tables that hold your data. Enter \d to display the tables.*/

\d

/*Looks like theres no tables or relations yet. Similar to how you created a database, you can create a table like this:
CREATE TABLE table_name();
Note that the parenthesis are needed for this one. It will create the table in the database you are connected to. Create a table named first_table in second_database.*/

create table first_table();

/*View the tables in second_database again with the display command. You should see your new table there with a little meta data about it.*/

\d

/*Create another new table in this database. Give it a name of second_table.*/

create table second_table();

/*There should be two tables in this database now. Display them again to make sure.*/

\d

/*You can view more details about a table by adding the table name after the display command like this: \d table_name. View more details about your second_table.*/

\d second_table;

/*Tables need columns to describe the data in them, yours doesn't have any yet. Here's an example of how to add one:
ALTER TABLE table_name ADD COLUMN column_name DATATYPE;
Add a column to second_table named first_column. Give it a data type of INT. INT stands for integer. Don't forget the semi-colon. 😄*/

alter table second_table add column first_column int;

/*Looks like it worked. Display the details of second_table again to see if your new column is there.*/

\d second_table

/*Your column is there 😄 Use ALTER TABLE and ADD COLUMN to add another column to second_table named id that's a type of INT.*/

alter table second_table add column id int;

/*Your table should have an id column added. View the details of second_table to make sure.*/

\d second_table

/*Add another column to second_table named age. Give it a data type of INT.*/

alter table second_table add column age int;

/*Take a look at the details of second_table again.*/

\d second_table;

/*Those are some good looking columns. You will probably need to know how to remove them. Here's an example:
ALTER TABLE table_name DROP COLUMN column_name;
Drop your age column.*/

alter table second_table drop column age;

/*View the details of second_table to see if it's gone.*/

\d second_table;

/*It's gone. Use the ALTER TABLE and DROP COLUMN keywords again to drop first_column.*/

alter table second_table drop column first_column;

/*A common data type is VARCHAR. It's a short string of characters. You need to give it a maximum length when using it like this: VARCHAR(30).
Add a new column to second_table, give it a name of name and a data type of VARCHAR(30).*/

alter table second_table add column name varchar(30);

/*Take a look at the details of second_table to see your columns.*/

\d second_table;

/*You can see the VARCHAR type there. The 30 means the data in it can be a max of 30 characters. You named that column name, it should have been username. Here's how you can rename a column:
ALTER TABLE table_name RENAME COLUMN column_name TO new_name;
Rename the name column to username.*/

alter table second_table rename column name to username;

/*Take a look at the details of second_table again to see if it got renamed.*/

\d second_table;

/*It worked. Rows are the actual data in the table. You can add one like this:
INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);
Insert a row into second_table. Give it an id of 1, and a username of Samus. The username column expects a VARCHAR, so you need to put Samus in single quotes like this: 'Samus'.*/

insert into second table (id, username) values ('1', 'Samus');

/*You should have one row in your table. You can view the data in a table by querying it with the SELECT statement. Here's how it looks:
SELECT columns FROM table_name;
Use a SELECT statement to view all the columns in second_table. Use an asterisk (*) to denote that you want to see all the columns.*/

select * from second_table;

/*There's your one row. Insert another row into second_table. Fill in the id and username columns with the values 2 and 'Mario'.*/

insert into second_table (id, username) values ('2', 'Mario');

/*You should now have two rows in the table. Use SELECT again to view all the columns and rows from second_table.*/

select * from second_table;

/*Insert another row into second_table. Use 3 as the id, and Luigi as the username this time.*/

inser into second_table (id, username) values ('3', 'Luigi');

/*You should now have three rows. Use SELECT again to see all the data you entered.*/

select * from second_table;

/*That gives me an idea 😃 You can make a database of Mario video game characters. You should start from scratch for it. Why don't you delete the record you just entered. Here's an example of how to delete a row:
DELETE FROM table_name WHERE condition;
Remove Luigi from your table. The condition you want to use is username='Luigi'.*/

delete from second_table where username = 'Luigi';

/*Luigi should be gone. Use SELECT again to see all the data and make sure he's not there.*/

select * from second_table;

/*It's gone. You can scrap all this for the new database. Delete Mario from second_table using the same command as before, except make the condition username='Mario' this time.*/

delete from second_table where username = 'Mario';

/*Only one more row should remain. Delete Samus from second_table.*/

delete from second_table where username = 'Samus';

/*Use SELECT again to see all the rows in second_table to make sure they're gone.*/

select * from second_table;

/*Looks like they're all gone. Remind yourself what columns you have in second_table by looking at its details.*/

\d second_table;

/*There's two columns. You won't need either of them for the Mario database. Alter the table second_table and drop the column username.*/

alter table second_table drop column username;

/*Next, drop the id column.*/

alter table second_table drop column column id;

/*Okay, the table has no rows or columns left. View the tables in this database to see what is here.*/

\d

/*Still two. You won't need either of those for the new database either. Drop second_table from your database. Here's an example:
DROP TABLE table_name;*/

drop table second_table;

/*Next, drop first_table from the database.*/

drop table first_table;

/*All the tables are gone now, too. View all the databases using the command to list them.*/

\l

/*Rename first_database to mario_database. You can rename a database like this:
ALTER DATABASE database_name RENAME TO new_database_name;*/

alter database first_database rename to mario_database;

/*List the databases to make sure it got renamed.*/

\l

/*Connect to your newly named database so you can start adding your characters.*/

\c mario_database;

/*Now that you aren't connected to second_database, you can drop it. Use the DROP DATABASE keywords to do that.*/

drop database second_database;

/*List the databases again to make sure it's gone.*/

\l

/*Okay, I think you're ready to get started. I don't think you created any tables here, take a look to make sure.*/

\d

/*Create a new table named characters, it will hold some basic information about Mario characters.*/

create table characters();

/*Next, you can add some columns to the table. Add a column named character_id to your new table that is a type of SERIAL.*/

alter table characters add column character_id serial;

/*The SERIAL type will make your column an INT with a NOT NULL constraint, and automatically increment the integer when a new row is added. View the details of the characters table to see what SERIAL did for you.*/

\d characters;

/*Add a column to characters called name. Give it a data type of VARCHAR(30), and a constraint of NOT NULL. Add a constraint by putting it right after the data type.*/

alter table characters add column name varchar(30) not null;

/*You can make another column for where they are from. Add another column named homeland. Give it a data type of VARCHAR that has a max length of 60.*/

alter table characters add column homeland varchar(60);

/*Video game characters are quite colorful. Add one more column named favorite_color. Make it a VARCHAR with a max length of 30.*/

alter table characters add column favorite_color varchar(30);

/*You should have four columns in characters. Take a look at the details of it to see how things are going.*/

\d characters;

/*You are ready to start adding some rows. First is Mario. Earlier, you used this command to add a row:
INSERT INTO second_table(id, username) VALUES(1, 'Samus');
The first parenthesis is for the column names, you can put as many columns as you want. The second parenthesis is for the values for those columns. Add a row to your table, give it a name of Mario, a homeland of Mushroom Kingdom, and a favorite_color of Red. Make sure to use single quotes where needed.*/

insert into characters(name, homeland, favorite_color) values ('Mario', 'Mushroom Kingdom', 'Red');

/*Mario should have a row now and his character_id should have been automatically added. View all the data in your characters table with SELECT to see this.*/

select * from characters;

/*Add another row for Luigi. Give it a name of Luigi, a homeland of Mushroom Kingdom, and a favorite_color of Green.*/

insert into characters(name, homeland, favorite_color) values ('Luigi', 'Mushroom Kingdom', 'Green');

/*View all the data in your characters table with SELECT again.*/

select * from characters;

/*Okay, it looks like it's all working. Add another row for Peach. Give her the values: Peach, Mushroom Kingdom, and Pink.*/

insert into characters(name, homeland, favorite_color) values ('Peach', 'Mushroom Kingdom', 'Pink');

/*Adding rows one at a time is quite tedious. Here's an example of how you could have added the previous three rows at once:
INSERT INTO characters(name, homeland, favorite_color)
VALUES('Mario', 'Mushroom Kingdom', 'Red'),
('Luigi', 'Mushroom Kingdom', 'Green'),
('Peach', 'Mushroom Kingdom', 'Pink');
Add two more rows. Give the first one the values: Toadstool, Mushroom Kingdom, and Red. Give the second one: Bowser, Mushroom Kingdom, and Green. Try to add them with one command.*/

insert into characters(name, homeland, favorite_color) values ('Toadstool', 'Mushroom Kingdom', 'Red'), ('Bowser', 'Mushroom Kingdom', 'Green');

/*If you don't get a message after a command, it is likely incomplete. This is because you can put a command on multiple lines. Add two more rows. Give the first one the values: Daisy, Sarasaland, and Yellow. The second: Yoshi, Dinosaur Land, and Green. Try to do it with one command.*/

insert into characters(name, homeland, favorite_color) values ('Daisy', 'Sarasaland', 'Yellow'), ('Yoshi', 'Dinosaur Land', 'Green');

/*Take a look at all the data in your table with SELECT to see where you stand.*/

select * from characters;

/*It looks good, but there's a few mistakes. You can change a value like this:
UPDATE table_name SET column_name=new_value WHERE condition;
You used username='Samus' as a condition earlier. SET Daisy's favorite_color to Orange. You can use the condition name='Daisy' to change her row.*/

update characters set favorite_color = 'Orange' where name = 'Daisy';

/*The command you just used does exactly what it sounds like. It finds the row where name is Daisy, and sets her favorite_color to Orange. Take a look at all the data in your table again to see if she got updated.*/

select * from characters;

/*Her favorite color was updated. Toadstool's name is wrong as well, it's actually Toad. Use UPDATE to SET his name to Toad. Use the condition favorite_color='Red'.*/

update characters set name = 'Toad' where favorite_color = 'Red';

/*Take a look at all the data in your table.*/

select * from characters;

/*Using favorite_color='Red' was not a good idea. Mario's name changed to Toad because he likes red, and now there's two rows that are the same. Well, almost. Only the character_id is different. You will have to use that to change it back to Mario. Use UPDATE to set the name to Mario for the row with the lowest character_id.*/

update characters set name = 'Mario' where character_id = '1';

/*Take a look at all the data in your table again to see if Mario's name got changed back.*/

select * from characters;

/*Looks like it worked. Toad's favorite color is wrong. He likes blue. Change Toad's favorite color to Blue. Use whatever condition you want, but don't change any of the other rows.*/

update characters set favorite_color = 'Blue' where character_id = '4';

/*Bowser's favorite_color is wrong. He likes Yellow. Why don't you update it without changing any of the other rows?*/

update characters set favorite_color = 'Yellow' where character_id = '5';

/*Bowser's homeland is wrong as well. He's from the Koopa Kingdom. Why don't you change it to that without changing any other rows?*/

update characters set homeland = 'Koopa Kingdom' where character_id = '5';

/*Take a look at all the data in your table again to make sure there's no more issues.*/

select * from characters;

/*Actually, you should put that in order. Here's an example:
SELECT columns FROM table_name ORDER BY column_name;
View all the data again, but put it in order by character_id.*/

select * from characters order by character_id;

/*It looks good. Next, you are going to add a primary key. It's a column that uniquely identifies each row in the table. Here's an example of how to set a PRIMARY KEY:
ALTER TABLE table_name ADD PRIMARY KEY(column_name);
The name column is pretty unique, why don't you set that as the primary key for this table.*/

alter table characters add primary key(name);

/*You should set a primary key on every table and there can only be one per table. Take a look at the details of your characters table to see the primary key at the bottom.*/

\d characters;

/*You can see the key for your name column at the bottom. It would have been better to use character_id for the primary key. Here's an example of how to drop a constraint:
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
Drop the primary key on the name column. You can see the constraint name is characters_pkey.*/

alter table characters drop constraint characters_pkey

/*View the details of the characters table to make sure it's gone.*/

\d characters;

/*It's gone. Set the primary key again, but use the character_id column this time.*/

alter table characters add primary key(character_id);

/*View the details of the characters table to see the new primary key.*/

\d characters;

/*That's better. The table looks complete for now. Next, create a new table named more_info for some extra info about the characters.*/

create table more_info();

\d

/*I wonder what that third one is. It says characters_character_id_seq. I think I have a clue. View the details of the characters table.*/

\d characters;

/*That is what finds the next value for the character_id column. Add a column to your new table named more_info_id. Make it a type of SERIAL.*/

alter table more_info add column more_info_id serial;

/*Set your new column as the primary key for this table.*/

alter table more_info add primary key (more_info_id);

/*View the tables in mario_database again with the display command. There should be another sequence there for the more_info_id because it also automatically increments.*/

\d

/*There it is. Add another column to more_info named birthday. Give it a data type of DATE.*/

alter table more_info add column birthday date;

/*Add a height column to more_info that's a type of INT.*/

alter table more_info add column height int;

/*Add a weight column. Give it a type of NUMERIC(4, 1). That data type is for decimals. NUMERIC(4, 1) has up to four digits and one of them has to be to the right of the decimal.*/

alter table more_info add column weight numeric(4, 1);

/*Take a look at the details of more_info to see all your columns.*/

\d more_info;

/*There’s your four columns and the primary key you created at the bottom. To know what row is for a character, you need to set a foreign key so you can relate rows from this table to rows from your characters table. Here's an example that creates a column as a foreign key:
ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES referenced_table_name(referenced_column_name);
That's quite the command. In the more_info table, create a character_id column. Make it an INT and a foreign key that references the character_id column from the characters table. Good luck.*/

alter table more_info add column character_id int references characters(character_id);

/*To set a row in more_info for Mario, you just need to set the character_id (foreign key) value to whatever it is in the characters table. Take a look at the details of more_info to see your foreign key.*/

\d more_info;

/*There's your foreign key at the bottom. These tables have a "one-to-one" relationship. One row in the characters table will be related to exactly one row in more_info and vice versa. Enforce that by adding the UNIQUE constraint to your foreign key. Here's an example:
ALTER TABLE table_name ADD UNIQUE(column_name);
Add the UNIQUE constraint to the column you just added.*/

alter table more_info add unique(character_id);

/*The column should also be NOT NULL since you don't want to have a row that is for nobody. Here's an example:
ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
Add the NOT NULL constraint to your foreign key column.*/

alter table more_info alter column character_id set not null;

/*Take a look at the details of your more_info table to see all the keys and constraints you added.*/

\d more_info;

/*The structure is set, now you can add some rows. First, you need to know what character_id you need for the foreign key column. You have viewed all columns in a table with *. You can pick columns by putting in the column name instead of *. Use SELECT to view the character_id column from the characters table.*/

select character_id from characters;

/*That list of numbers doesn't really help. Use SELECT again to display both the character_id and name columns from the characters table. You can separate the column names with a comma to view both.*/

select character_id, name from characters;

/*That's better. You can see Mario's id there. Here's some more info for him:
birthday	height	weight
1981-07-09	155	64.5
Add a row to more_info with the above data for Mario using the INSERT INTO and VALUES keywords. Be sure to set his character_id when adding him. Also, DATE values need a string with the format: 'YYYY-MM-DD'.*/

insert into more_info values ('1', '1981-07-09', '155', '64.5', '1');

/*View all the data in more_info to make sure it's looking good.*/

select * from more_info;

/*Next, you are going to add some info for Luigi. Use SELECT again to view the character_id and name columns from the characters table to find his id.*/

select character_id, name from characters;

/*You can see Luigi's id there. Here's his info:
birthday	height	weight
1983-07-14	175	48.8
Add a row in more_info for Luigi using the above info. Be sure to add his character_id as well.*/

insert into more_info values ('2', '1983-07-14', '175', '48.8', '2');

/*View all the data in more_info to see more info for Luigi.*/

select * from more_info;

/*Peach is next. View the character_id and name columns from the characters table again so you can find her id.*/

select character_id, name from characters;

/*Here's the additional info for Peach:
birthday	height	weight
1985-10-18	173	52.2
Add a row for Peach using the above info. Be sure to add her character_id as well.*/

insert into more_info values ('3', '1985-10-18', '173', '52.2', '3');

/*Toad is next. Instead of viewing all the rows to find his id, you can just view his row with a WHERE condition. You used several earlier to delete and update rows. You can use it to view rows as well. Here's an example:
SELECT columns FROM table_name WHERE condition;
A condition you used before was username='Samus'. Find Toad's id by viewing the character_id and name columns from characters for only his row.*/

select character_id, name from characters where name = 'Toad';

/*Here's what Toad's info looks like:
birthday	height	weight
1950-01-10	66	35.6
Add the above info for Toad. Be sure to add his character_id.*/

insert into more_info values ('4', '1950-01-10', '66', '35.6', '4');

/*View all the data in more_info to see the rows you added.*/

select * from more_info;

/*Bowser is next. Find his id by viewing the character_id and name columns for only his row.*/

select character_id, name from characters where name = 'Bowser';

/*Here's what Bowser's info looks like:

birthday	height	weight
1990-10-29	258	300
Add the above info for Bowser. Don't forget to add his character_id.*/

insert into more_info values ('5', '1990-10-29', '258', '300', '5');

/*Daisy is next. Find her id by viewing the character_id and name columns for only her row.*/

select character_id, name from characters where name = 'Daisy';

/*The info for Daisy looks like this:
birthday	height	weight
1989-07-31	NULL	NULL
Add the above info for Daisy to more_info. Be sure to add her character_id as well. You can use NULL or simply not include the null columns when inserting.*/

insert into more_info values ('6', '1989-07-31', null, null, '6');

/*View all the data in more_info to see the rows you added.*/

select * from more_info;

/*Null values show up as blank. Yoshi is last. Find his id by viewing the character_id and name columns for only his row.*/

select character_id, name from characters where name = 'Yoshi';

/*The info for Yoshi looks like this:
birthday	height	weight
1990-04-13	162	59.1
Add the above info for Yoshi to more_info. Be sure to include his character_id.*/

insert into more_info values ('7', '1990-04-13', '162', '59.1', '7');

/*There should be a lot of data in more_info now. Take a look at all the rows and columns in it.*/

select * from more_info;

/*It looks good. There is something you can do to help out though. What units do the height and weight columns use? It's centimeters and kilograms, but nobody will know. Rename the height column to height_in_cm.*/

alter table more_info rename column height to height_in_cm;

/*Rename the weight column to weight_in_kg.*/

alter table more_info rename column weight to weight_in_kg;

/*Take a quick look at all the data in more_info to see the new column names.*/

select * from more_info;

/*Next, you will make a sounds table that holds filenames of sounds the characters make. You created your other tables similar to this:
CREATE TABLE table_name();
Inside those parenthesis you can put columns for a table so you don't need to add them with a separate command, like this:
CREATE TABLE table_name(column_name DATATYPE CONSTRAINTS);
Create a new table named sounds. Give it a column named sound_id of type SERIAL and a contraint of PRIMARY KEY.*/

create table sounds(sound_id serial primary key);

/*View the tables in mario_database to make sure it worked.*/

\d

/*There's your sounds table. Add a column to it named filename. Make it a VARCHAR that has a max length of 40 and with constraints of NOT NULL and UNIQUE. You can put those contraints at the end of the query to add them all.*/

alter table sounds add column filename varchar(40) not null unique;

/*You want to use character_id as a foreign key again. This will be a "one-to-many" relationship because one character will have many sounds, but no sound will have more than one character. Here's the example again:
ALTER TABLE table_name ADD COLUMN column_name DATATYPE CONSTRAINT REFERENCES referenced_table_name(referenced_column_name);
Add a column to sounds named character_id. Give it the properties INT, NOT NULL, and set it as a foreign key that references character_id from characters.*/

alter table sounds add column character_id int not null references characters(character_id);

/*Take a look at the details of the sounds table to see all the columns.*/

\d sounds;

