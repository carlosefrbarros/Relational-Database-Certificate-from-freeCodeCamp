#Learn SQL by Building a Student Database: Part 1

/*The first thing you need to do is start the terminal. Do that by clicking the "hamburger" menu at the top left of the screen, going to the "terminal" section, and clicking "new terminal". Once you open a new one, type echo hello SQL into the terminal and press enter.*/

echo hello SQL

/*You are started with two .csv files with info about your computer science students. You should take a look at them. The top row in each file has titles, and the rest are values for those titles. You will be adding all that info to a PostgreSQL database. Log into the psql interactive terminal with psql --username=freecodecamp --dbname=postgres to get started.*/

psql --username=freecodecamp --dbname=postgres

/*View the existing databases with the \l shortcut command to see what's here.*/

\l

/*All the info from the CSV files will go into a single database. Create a new database named students.*/

create database students;

/*View the databases again to make sure it got created.*/

\l

/*There it is. Connect to your new database so you can start adding tables.*/

\c students

/*The CSV files have a bunch of students with info about them, and some courses and majors. You will have four tables. One for the students and their info, one for each major, another for each course, and a final one for showing what courses are included in each major. First, create the students table.*/

create table students();

/*The second table will be for each unique major that appears in the data. Create a table named majors.*/

create table majors();

/*The third table is for each unique course in the data. Create another table named courses.*/

create table courses();

/*The final table will be a junction table for the majors and courses. Create it with the name majors_courses.*/

create table majors_courses();

/*Use the display shortcut command to view your tables to make sure your satisfied with them.*/

\d

/*Onto the columns. The students.csv file has four fields, you will make a column for each of those as well as an ID column. Add a column to your students table named student_id. Give it a type of SERIAL so it automatically increments and make it a PRIMARY KEY*/

alter table students add column student_id serial primary key;

/*The first column in students.csv is first_name. Add a column to the students table with that name. Make it a type of VARCHAR(50) and give it the NOT NULL constraint.*/

alter table students add column first_name varchar(50) not null;

/*The next column in the data is last_name. Add it to the students table. Give it the same data type and max-length as first_name and make sure it has the NOT NULL constraint.*/

alter table students add column last_name varchar(50) not null;

/*The next column is for the major. Since you will have each major in another table this column will be a foreign key that references it. Create a column in the students table named major_id, give it a data type of INT for now. You will come back and set the foreign key later.*/

alter table students add column major_id int;

/*Create the last column, gpa. The data in the CSV shows that they are decimals with a length of 2 and 1 number is to the right of the decimal. So give it a data type of NUMERIC(2,1).*/

alter table students add column gpa numeric(2,1);

/*Use the shortcut command to display the details of the students table to make sure you like it.*/

\d students;

/*The foreign key is still missing. Let's fill in the majors table next. Add a major_id column to it. Make it a type of SERIAL and the PRIMARY KEY for this table.*/

alter table majors add column major_id serial primary key;

/*This table will only have one other column for the name of the major. Add a column to it named major. Make it a VARCHAR with a max-length of 50 and give it the NOT NULL constraint.*/

alter table majors add column major varchar(50) not null;

/*View the details of the majors table to make sure you like it.*/

\d majors;

/*This table looks good. Now, set the major_id column from the students table as a foreign key that references the major_id column from the majors table. Here's an example of how to do that: ALTER TABLE <table_name> ADD FOREIGN KEY(<column_name>) REFERENCES <referenced_table_name>(<referenced_column_name>);*/

alter table students add foreign key(major_id) references majors(major_id);

/*View the details of the students table again to make sure the key is there.*/

\d students;

/*Next, is the courses table. Add a course_id column to it. Give it a type of SERIAL and make it the primary key.*/

alter table courses add column course_id serial primary key;

/*Add a course column to the courses table that's a type of VARCHAR. The course names are a little longer, so give them a max-length of 100. Also, make sure it can't accept null values.*/

alter table courses add column course varchar(100) not null;

/*View the details of the courses table to make sure it looks good.*/

\d courses;

/*One more table to go. The majors_courses junction table will have two columns, each referencing the primary key from two related table. First, add a major_id column to it. Just give it a type of INT for now.*/

alter table majors_courses add column major_id int;

/*Set the major_id column you just created as a foreign key that references the major_id column from the majors table.*/

alter table majors_courses add foreign key(major_id) references majors(major_id);

/*Next, add a course_id column to the same table. Just give it a type of INT again for now.*/

alter table majors_courses add column course_id int;

/*Set your new course_id column as a foreign key that references the other course_id column.*/

alter table majors_courses add foreign key(course_id) references courses(course_id);

/*View the details of the table you just worked on to make sure the structure is finished.*/

\d majors_courses;

/*There's one thing missing. This table doesn't have a primary key. The data from courses.csv will go in this table. A single major will be in it multiple times, and same with a course. So neither of them can be a primary key. But there will never be a row with the same two values as another row. So the two columns together, are unique. You can create a composite primary key that uses more than one column as a unique pair like this: ALTER TABLE <table_name> ADD PRIMARY KEY(<column_name>, <column_name>); Add a composite primary key to the table using the two columns.*/

