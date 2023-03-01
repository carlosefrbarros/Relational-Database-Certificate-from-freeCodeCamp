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

alter table majors_course add primary key(major_id, course_id);

/*View the details of the table again.*/

\d majors_courses;

/*Okay, now it's finished. View all the tables you ended up with.*/

\d

/*Next, you can start adding some info. Since the students table needs a major_id, you can add a major first. View the details of the majors table to see what info it expects.*/

\d majors;

/*It only needs the name of a major. The ID will be added automatically. Add the first major from the courses.csv file into the majors table. It's a VARCHAR, so make sure to put the value in single quotes.*/

insert into majors(major) values ('Database Administration');

/*Use SELECT to view all the data in the majors table to make sure it got inserted correctly.*/

select * from majors;

/*Next, insert the first course from courses.csv into the courses table.*/

insert into courses(course) values ('Data Structures and Algorithms');

/*View all the data in the courses table to make sure it got added.*/

select * from courses;

/*Next, you can add a row into the junction table. View the details of it to see what it expects.*/

\d majors_courses;

/*It wants a major_id and course_id. Add a row to majors_courses for the first entry in courses.csv.*/

insert into majors_courses values ('1', '1');

/*View all the data in the table you just added to.*/

select * from majors_courses;

/*Looks like the row got added. View the details of the students table to remind yourself what it expects so you can add the first student to the database.*/

\d students;

/*The output shows what the table needs. Insert the first person from students.csv into the students table.*/

insert into students(first_name, last_name, major_id, gpa) values ('Rhea', 'Kellems', '1', '2.5');

/*Looks like it worked. View all the data in the students table to make sure.*/

select * from students;

/*Okay, you added a row into each table. It might be wise to review the data and the database structure. Adding the rest of the info one at a time would be tedious. You are going to make a script to do it for you. I recommend "splitting" the terminal for this part. You can do that by clicking the "hamburger" menu at the top left of the window, going to the "Terminal" menu, and clicking "Split Terminal". Once you've done that, use the touch command to create a file named insert_data.sh in your project folder.*/

touch insert_data.sh

/*You should have two terminals open. One connected to PostgreSQL, and one for entering terminal commands. In the one for terminal commands, use the chmod command with the +x flag to give you new script executable permissions.*/

chmod +x insert_data.sh

/*Open your new file and add a "shebang" that uses bash at the top. It looks like this: #!/bin/bash.*/

#!/bin/bash

/*Below that, add a single line comment with the text, Script to insert data from courses.csv and students.csv into students database.*/

#Script to insert data from courses.csv and students.csv into students database

/*First, you should add all the info from the courses.csv file since you need the major_id for inserting the student info. cat is a terminal command for printing the contents of a file. Here's an example: cat <filename>. Below the comment you added, use it to print courses.csv.*/

cat courses.csv

/*Run your script to see if the file contents get printed.*/

./insert_data.sh

/*It worked. Instead of printing the content, you can pipe that output into a while loop so you can go through the rows one at a time. It looks like this:
cat courses.csv | while read MAJOR COURSE
do
  <STATEMENTS>
done
Each new line will be read into the variables, MAJOR and COURSE. Add the above to your cat command. In the STATEMENTS area, use echo to print the MAJOR variable.*/

cat courses.csv | while read MAJOR COURSE
do
  echo $MAJOR
done

/*Run the script to see if it worked.*/

./insert_data.sh

/*It's looping, but the MAJOR variable is only being set to the first word. There's a default IFS variable in bash. IFS stands for "Internal Field Separator". View it with declare -p IFS.*/

declare -p IFS

/*This variable is used to determine word boundaries. It defaults to spaces, tabs, and new lines. This is why the MAJOR variable was set to only the first word on each line from the data. Between the while and read commands, set the IFS to a comma like this: IFS=","*/

cat courses.csv | while IFS="," read MAJOR COURSE
do
  echo $MAJOR
done

/*Now, it should use the comma in the data to separate words instead of spaces. Run the script again to see if it's working.*/

./insert_data.sh

/*Looks like that worked. It prints the whole major, including the space. Print the COURSE variable on the same line as where you print MAJOR to make sure it's all working.*/

cat courses.csv | while IFS="," read MAJOR COURSE
do
  echo $MAJOR $COURSE
done

/*Run the script again to check.*/

./insert_data.sh

/*Okay, your loop is working. You can use the MAJOR and COURSE variables to access the major or course when you need to insert data or query the database. Delete the echo line so you can figure out what to do next.*/

/*It helps to plan out what you want to happen. For each loop, you will want to add the major to the database if it isn't in there yet. Same for the course. Then add a row to the majors_courses table. Add these single line comments in your loop in this order: get major_id, if not found, insert major, get new major_id, get course_id, if not found, insert course, get new course_id, insert into majors_courses.*/

cat courses.csv | while IFS="," read MAJOR COURSE
do
  #get major_id
  #if not found
  #insert major
  #get new major_id
  #get course_id
  #if not found
  #insert course
  #get new course_id
  #insert into majors_courses
done

/*You used the psql command to log in and interact with the database. You can use it to just run a single command and exit. Above your loop, add a PSQL variable that looks like this: PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c". This will allow you to query your database from your script. The important parts are the username, dbname, and the -c flag that is for running a single command and exiting. The rest of the flags are for formatting.*/

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

/*Now, you can query your database using the PSQL variable like this: $($PSQL "<query_here>"). Below the get major_id comment in your loop, create a MAJOR_ID variable. Set it equal to the result of a query that gets the major_id of the current MAJOR in the loop. Make sure to put your MAJOR variable in single quotes.*/

cat courses.csv | while IFS="," read MAJOR COURSE
do
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  #if not found
  #insert major
  #get new major_id
  #get course_id
  #if not found
  #insert course
  #get new course_id
  #insert into majors_courses
done

/*Below the variable you just created, use echo to print it so you can see it's value when you run the script.*/

cat courses.csv | while IFS="," read MAJOR COURSE
do
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  echo $MAJOR_ID
  #if not found
  #insert major
  #get new major_id
  #get course_id
  #if not found
  #insert course
  #get new course_id
  #insert into majors_courses
done

/*Run the script to see what happens.*/

./insert_data.sh

/*So it went through each major from the CSV file and tried to find major_id for each one from the database. Looks like it only found the one you manually inserted earlier. The rest were empty. Below your first if not found comment, add an if condition that checks if the MAJOR_ID variable is empty. You can do that with this test: [[ -z $MAJOR_ID ]]. Place the next two comments in the statements area of the if.*/

cat courses.csv | while IFS="," read MAJOR COURSE
do
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  echo $MAJOR_ID
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #insert major
    #get new major_id
  fi
  #get course_id
  #if not found
  #insert course
  #get new course_id
  #insert into majors_courses
done

/*The loop will go into this if whenever a major isn't found. Here, you will want to insert the major and then get the new id. You will need the ID for inserting data into the majors_courses table later. Below your insert major comment, create an INSERT_MAJOR_RESULT variable. Set it's value to a query that inserts the current major into the database. Don't forget to use single quotes around the value.*/

cat courses.csv | while IFS="," read MAJOR COURSE
do
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  echo $MAJOR_ID
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #insert major
    INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values ('$MAJOR')")
    #get new major_id
  fi
  #get course_id
  #if not found
  #insert course
  #get new course_id
  #insert into majors_courses
done

/*Below the variable you just created, use echo to print it.*/

cat courses.csv | while IFS="," read MAJOR COURSE
do
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  echo $MAJOR_ID
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #insert major
    INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values ('$MAJOR')")
    echo $INSERT_MAJOR_RESULT
    #get new major_id
  fi
  #get course_id
  #if not found
  #insert course
  #get new course_id
  #insert into majors_courses
done

/*Instead of running through all the data in the CSV file, you should make some test data. In the terminal, use the copy (cp) command to copy the courses.csv into a new file named courses_test.csv.*/

cp courses.csv courses_test.csv

/*In your new file, remove all the data except for the first five lines. Make sure there's a single empty line at the bottom.*/

/*Back in the insert_data.sh script, change your cat command to loop through the test file instead of the full one.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  echo $MAJOR_ID
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #insert major
    INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values ('$MAJOR')")
    echo $INSERT_MAJOR_RESULT
    #get new major_id
  fi
  #get course_id
  #if not found
  #insert course
  #get new course_id
  #insert into majors_courses
done

/*Run the script. It will go through the test data and insert a major into the database each time it doesn't find one already there and print the MAJOR_ID and INSERT_MAJOR_RESULT variables.*/

./insert_data.sh

/*Looks like it found an ID that was already in the database twice and inserted three new items into the database. You don't need to print the ID anymore so delete the echo $MAJOR_ID line.*/

/*In the psql prompt, use SELECT to view all the data from the majors table to see what the script added.*/

select * from majors;

/*I forgot you inserted Database Administration earlier. The script ran and inserted major from the top line of the file. Then it added the other two that weren't already in there. You can use TRUNCATE to delete all data from a table. In the psql prompt, try to delete all the data in the majors table by entering TRUNCATE majors;*/

truncate majors;

/*It says you "cannot truncate a table referenced in a foreign key constraint." The students and majors_courses tables use the major_id from majors as a foreign key. So if you want to delete the data from majors, you need to delete the data from those two tables at the same time. Use TRUNCATE to delete the data from those three tables. Separate the tables with commas.*/

truncate majors, students, majors_courses;

/*View all the data in the majors table to make sure it's empty.*/

select * from majors;

/*Looks like it worked. View all the data in the majors_courses table to see if that one is empty.*/

select * from majors_courses;

/*It is, check the students table.*/

select * from students;

/*Last, check the courses table.*/

select * from courses;

/*There should still be one entry in there. Use TRUNCATE to delete all the data from the courses table. You will need to truncate any tables that use a column from it as a foreign key at the same time.*/

truncate courses, majors_courses;

/*View all the data in the courses table again.*/

select * from courses;

/*Now the database is completely empty. Run the script again to see what gets inserted when the database is empty.*/

./insert_data.sh

/*It inserted four that time. In the psql prompt, view all the data in the majors table.*/

select * from majors;

/*You won't want to add the first line from the CSV file to the database since those are just titles. In your script, add an if condition at the top of your loop that checks if $MAJOR != major. Put all the existing code and comments in your loop in it's statements area so it only does any of it if it's not the first line.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      echo $INSERT_MAJOR_RESULT
      # get new major_id
    fi
    # get course_id
    # if not found
    # insert course
    # get new course_id
    # insert into majors_courses
  fi
done

/*In the psql prompt, use TRUNCATE to delete all the data in the majors table.*/

truncate majors, students, majors_courses;

/*View all the data in majors table to make sure it's empty.*/

select * from majors;

/*Run the script to make sure it's not adding the first line anymore.*/

./insert_data.sh

/*It only showed three inserts, that's a good sign. View all the data in majors table to make sure it's three you want.*/

select * from majors;

/*There's three unique majors in your test data. Those were the three added to the database, so it looks like it's working. Delete the line where you print INSERT_MAJOR_RESULT.*/

/*You want a nicer message when something get's inserted so it's more informative. Below your INSERT_MAJOR_RESULT variable, add an if statement that checks if the variable is equal to INSERT 0 1, which was what it was printing. Use echo to print Inserted into majors, $MAJOR in the statements area of the if.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
    fi
    # get course_id
    # if not found
    # insert course
    # get new course_id
    # insert into majors_courses
  fi
done

/*In the psql prompt, truncate the majors table again so you can run the script and see the output.*/

truncate majors, students, majors_courses;

/*Check to make sure the table is empty. Then, run the script.*/

select * from majors;

./insert_data.sh

/*It's starting to come together. Below your get new major_id comment, set the MAJOR_ID variable to a query that gets the new major_id from the database.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    # if not found
    # insert course
    # get new course_id
    # insert into majors_courses
  fi
done

/*So the script will insert the majors correctly. Next are the courses. It will be the same steps as for the majors. Below your get course_id comment, add a COURSE_ID variable that gets the course_id from the database. Remember that your COURSE variable will have the current course in the loop.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    # if not found
    # insert course
    # get new course_id
    # insert into majors_courses
  fi
done


/*It's the same as the majors, so below the second if not found comment, add an if statement that checks if the query was empty so you can insert the course if needed. Place the existing insert course and get new course_id comments in the statements area of the if.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      # get new course_id
    fi
    # insert into majors_courses
  fi
done

/*Below the insert course comment, create an INSERT_COURSE_RESULT variable that inserts the course into the database.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "insert into courses(course) values('$COURSE')")
      # get new course_id
    fi
    # insert into majors_courses
  fi
done

/*The variable should be INSERT 0 1 again if something gets inserted. Below the variable you just created, add an if condition that checks if it is and print Inserted into courses, $COURSE using echo in it's statements area.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "insert into courses(course) values('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into courses, $COURSE"
      fi
      # get new course_id
    fi
    # insert into majors_courses
  fi
done

/*In the psql prompt, truncate the data from the majors table so you can run the script again.*/

truncate majors, students, majors_courses;

/*Run the script to see if the courses get inserted into the database.*/

./insert_data.sh

/*It looks like it worked. The test data has three unique courses, and three got added to the database. View the data in the courses table to make sure they are correct.*/

select * from courses;

/*Excellent. Instead of manually deleting the data each time you want to run the script, add the command to do it for you. Near the top of the file below your PSQL variable, use echo to query the database. In the query, truncate your four tables in this order: students, majors, courses, majors_courses.*/

echo $($PSQL "truncate students, majors, courses, majors_courses")

/*Run the script to see if it works.*/

./insert_data.sh

/*Awesome. That makes it easier. Below your get new course_id comment, set the COURSE_ID to the newly inserted course_id.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "insert into courses(course) values('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into courses, $COURSE"
      fi
      # get new course_id
      COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    fi
    # insert into majors_courses
  fi
done

/*One more thing to add for this file. Below the insert into majors_courses courses comment, create a INSERT_MAJORS_COURSES_RESULT variable. Use it and the MAJOR_ID and COURSE_ID variables you created to insert a row into the majors_courses table. Make sure the query has the major_id column first. Also, you won't need any quotes around the values for the ID's.*/


cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "insert into courses(course) values('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into courses, $COURSE"
      fi
      # get new course_id
      COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    fi
    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "insert into majors_courses(major_id, course_id) values($MAJOR_ID, $COURSE_ID)")
  fi
done

/*Below the variable you just created, add an if condition that checks if it's equal to INSERT 0 1 like the others. In it's statements area, use echo to print Inserted into majors_courses, $MAJOR : $COURSE.*/

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "insert into courses(course) values('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into courses, $COURSE"
      fi
      # get new course_id
      COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    fi
    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "insert into majors_courses(major_id, course_id) values($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors_courses, $MAJOR : $COURSE"
      fi
  fi
done

/*Run the script. Your tables should get truncated and then it should go through the loop and add all the data from the courses_test.csv into the three tables of the database.*/

./insert_data.sh

/*Looks like it works. You better look around to make sure. View the data in the majors table.*/

select * from majors;

/*Cool, check the courses table.*/

select * from courses;

/*Lastly, view the data in the majors_courses table. There should be four rows.*/

select * from majors_courses;

/*Alright, that part of the script is done. Next, you need to add everything from the students.csv file. Make some test data again. In the terminal, use the copy command to copy students.csv into a file named students_test.csv.*/

cp students.csv students_test.csv

/*In the students_test.csv file, remove everything but the first five lines like you did for the other test file. Make sure there's an empty line at the bottom again.*/

/*You want to loop through all this info like you did for the other CSV file. The process is the same. Below your existing loop, use cat to print your new test file. Pipe the results into a while loop, setting the IFS to a comma again, and then use read to create FIRST, LAST, MAJOR and GPA variables from the data. In the loop, use echo to print the FIRST variable.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  echo $FIRST
done

/*Run the script to see if it prints the FIRST (first_name) variable correctly. It will take a second since it has to go through the first loop.*/

./insert_data.sh

/*It works 😅 It printed the first item in each row of the CSV file. It's printing the first line again, you will have to take care of that. First, delete the echo line.*/

/*Add an if condition to the loop that checks if the FIRST variable is not equal to first_name so it doesn't do anything for the first line of the file. Don't put anything in the statements area for now.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  fi
done

/*All the columns in the CSV file can be inserted directly into the database except for the major. You will need to get the major_id again for that. There's some null values in there as well, so you will need to use null if the major_id isn't found. Add four single line comments in your loop; get major_id, if not found, set to null, and insert student in that order.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  #if not found
  #set to null
  #insert student
  fi
done

/*Below the new get major_id comment, set the MAJOR_ID variable to a query that gets the major_id for the current students major.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  #if not found
  #set to null
  #insert student
  fi
done

/*Below that, use echo to print the variable so you can see if it's working.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  echo $MAJOR_ID
  #if not found
  #set to null
  #insert student
  fi
done

/*Run the script to see what happens.*/

./insert_data.sh

/*Looking at the test data, it found the ID for all of it except the null value. Below the newest if not found comment, add an if that checks if the variable is empty. Put the set to null comment in its statements area.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  echo $MAJOR_ID
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #set to null
  fi
  #set to null
  #insert student
  fi
done

/*When you go to insert the student data, you want to use the MAJOR_ID if it's found, or null if not. Below the set to null comment, set the MAJOR_ID variable to null so you can use it to insert the data.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  echo $MAJOR_ID
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #set to null
    MAJOR_ID=null
  fi
  #set to null
  #insert student
  fi
done

/*Move the echo $MAJOR_ID line to below the if statement so you can run the script and see the value of the variable if the major_id is or isn't found.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #set to null
    MAJOR_ID=null  
  fi
  echo $MAJOR_ID
  #set to null
  #insert student
  fi
done

/*Run the script.*/

./insert_data.sh

/*Okay, that should work for inserting the student. Delete the echo $MAJOR_ID line.*/

/*One last thing to add. In the psql prompt, view the details of the students table so you can see what columns to add.*/

\d students;

/*You will need to set the four columns when adding the student info. All of them except student_id. Below the insert student comment, create an INSERT_STUDENT_RESULT variable that adds the student to the database. Add the columns in the order they appear in the data, and make sure to only put the two VARCHAR columns in single quotes.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #set to null
    MAJOR_ID=null  
  fi
  #set to null
  #insert student
  INSERT_STUDENT_RESULT=$($PSQL "insert into students(first_name, last_name, major_id, gpa) values ('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
  fi
done

/*Below the variable you just created, add an if statement that checks if it's equal to INSERT 0 1 like the others. If it is, use echo to print Inserted into students, <first_name> <last_name>.*/

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #set to null
    MAJOR_ID=null  
  fi
  #set to null
  #insert student
  INSERT_STUDENT_RESULT=$($PSQL "insert into students(first_name, last_name, major_id, gpa) values ('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
  if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
  then
    echo "Inserted into students, $FIRST $LAST"
  fi
  fi
done

/*Run the script to see if the students are getting added.*/

./insert_data.sh

/*I think it's working. View all the data in the students table to make sure it matches the CSV file.*/

select * from students;

/*Excellent. It added all the students from the test data. Time to try it with the original files. Change the cat courses_test.csv line to use the original file again.*/

/*Next, change the cat students_test.csv line to use the original file as well.*/

#!/bin/bash

#Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

echo $($PSQL "truncate students, majors, courses, majors_courses")

cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors, $MAJOR"
      fi
      # get new major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    fi
    # get course_id
    COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "insert into courses(course) values('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into courses, $COURSE"
      fi
      # get new course_id
      COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
    fi
    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "insert into majors_courses(major_id, course_id) values($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors_courses, $MAJOR : $COURSE"
      fi
  fi
done

cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
   if [[ $FIRST != first_name ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #set to null
    MAJOR_ID=null  
  fi
  #set to null
  #insert student
  INSERT_STUDENT_RESULT=$($PSQL "insert into students(first_name, last_name, major_id, gpa) values ('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
  if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
  then
    echo "Inserted into students, $FIRST $LAST"
  fi
  fi
done

/*Time for the moment of truth. Run the script and see if it works.*/

./insert_data.sh

/*That was cool. View all the data in the students table to see what you ended up with.*/

select * from students;

/*31 rows. That's how many are in the CSV file. Perfect. Next, check the majors table.*/

select * from majors;

/*7 rows. There must be 7 unique majors in the CSV file. View what's in the courses table.*/

select * from courses;

/*Looks like there's 17 unique courses in the CSV file. Last, view the data in majors_courses. This should have the same number of rows at the CSV file.*/

select * from majors_courses;

/*28 rows, same as the CSV file. I think all the data got added correctly. You don't need your test files anymore. In the terminal, use the list command to check what files are in your project folder.*/

ls

/*Use the remove command (rm) to delete the students_test.csv file.*/

rm students_test.csv

/*Use the same command to delete the courses_test.csv file.*/

rm courses_test.csv

/*List the contents of the folder again to make sure they're gone.*/

ls

/*The database is finished for now. The last thing you are going to do is make a "dump" of it. The pg_dump command can do that for you. Use the --help flag with the command to see what it can do.*/

pg_dump --help

/*This is the last step. There's quite a few options there. Enter pg_dump --clean --create --inserts --username=freecodecamp students > students.sql in the terminal to dump the database into a students.sql file. It will save all the commands needed to rebuild it. Take a quick look at the file when you are done.*/

pg_dump --clean --create --inserts --username=freecodecamp students > students.sql

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (26, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (27, 'Web Programming');
INSERT INTO public.courses VALUES (28, 'Database Systems');
INSERT INTO public.courses VALUES (29, 'Computer Networks');
INSERT INTO public.courses VALUES (30, 'SQL');
INSERT INTO public.courses VALUES (31, 'Machine Learning');
INSERT INTO public.courses VALUES (32, 'Computer Systems');
INSERT INTO public.courses VALUES (33, 'Web Applications');
INSERT INTO public.courses VALUES (34, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (35, 'Python');
INSERT INTO public.courses VALUES (36, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (37, 'Calculus');
INSERT INTO public.courses VALUES (38, 'Game Architecture');
INSERT INTO public.courses VALUES (39, 'Algorithms');
INSERT INTO public.courses VALUES (40, 'UNIX');
INSERT INTO public.courses VALUES (41, 'Server Administration');
INSERT INTO public.courses VALUES (42, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (39, 'Database Administration');
INSERT INTO public.majors VALUES (40, 'Web Development');
INSERT INTO public.majors VALUES (41, 'Data Science');
INSERT INTO public.majors VALUES (42, 'Network Engineering');
INSERT INTO public.majors VALUES (43, 'Computer Programming');
INSERT INTO public.majors VALUES (44, 'Game Design');
INSERT INTO public.majors VALUES (45, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (39, 26);
INSERT INTO public.majors_courses VALUES (40, 27);
INSERT INTO public.majors_courses VALUES (39, 28);
INSERT INTO public.majors_courses VALUES (41, 26);
INSERT INTO public.majors_courses VALUES (42, 29);
INSERT INTO public.majors_courses VALUES (39, 30);
INSERT INTO public.majors_courses VALUES (41, 31);
INSERT INTO public.majors_courses VALUES (42, 32);
INSERT INTO public.majors_courses VALUES (43, 29);
INSERT INTO public.majors_courses VALUES (39, 33);
INSERT INTO public.majors_courses VALUES (44, 34);
INSERT INTO public.majors_courses VALUES (41, 35);
INSERT INTO public.majors_courses VALUES (43, 36);
INSERT INTO public.majors_courses VALUES (45, 32);
INSERT INTO public.majors_courses VALUES (44, 37);
INSERT INTO public.majors_courses VALUES (40, 26);
INSERT INTO public.majors_courses VALUES (41, 37);
INSERT INTO public.majors_courses VALUES (40, 36);
INSERT INTO public.majors_courses VALUES (44, 38);
INSERT INTO public.majors_courses VALUES (45, 29);
INSERT INTO public.majors_courses VALUES (44, 39);
INSERT INTO public.majors_courses VALUES (45, 40);
INSERT INTO public.majors_courses VALUES (45, 41);
INSERT INTO public.majors_courses VALUES (43, 32);
INSERT INTO public.majors_courses VALUES (43, 35);
INSERT INTO public.majors_courses VALUES (42, 42);
INSERT INTO public.majors_courses VALUES (40, 33);
INSERT INTO public.majors_courses VALUES (42, 39);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (6, 'Rhea', 'Kellems', 39, 2.5);
INSERT INTO public.students VALUES (7, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (8, 'Kimberly', 'Whitley', 40, 3.8);
INSERT INTO public.students VALUES (9, 'Jimmy', 'Felipe', 39, 3.7);
INSERT INTO public.students VALUES (10, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (11, 'Casares', 'Hijo', 44, 4.0);
INSERT INTO public.students VALUES (12, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (13, 'Sterling', 'Boss', 44, 3.9);
INSERT INTO public.students VALUES (14, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (15, 'Kaija', 'Uronen', 44, 3.7);
INSERT INTO public.students VALUES (16, 'Faye', 'Conn', 44, 2.1);
INSERT INTO public.students VALUES (17, 'Efren', 'Reilly', 40, 3.9);
INSERT INTO public.students VALUES (18, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (19, 'Maxine', 'Hagenes', 39, 2.9);
INSERT INTO public.students VALUES (20, 'Larry', 'Saunders', 41, 2.2);
INSERT INTO public.students VALUES (21, 'Karl', 'Kuhar', 40, NULL);
INSERT INTO public.students VALUES (22, 'Lieke', 'Hazenveld', 44, 3.5);
INSERT INTO public.students VALUES (23, 'Obie', 'Hilpert', 40, NULL);
INSERT INTO public.students VALUES (24, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (25, 'Nathan', 'Turner', 39, 3.3);
INSERT INTO public.students VALUES (26, 'Gerald', 'Osiki', 41, 2.2);
INSERT INTO public.students VALUES (27, 'Vanya', 'Hassanah', 44, 4.0);
INSERT INTO public.students VALUES (28, 'Roxelana', 'Florescu', 39, 3.2);
INSERT INTO public.students VALUES (29, 'Helene', 'Parker', 41, 3.4);
INSERT INTO public.students VALUES (30, 'Mariana', 'Russel', 40, 1.8);
INSERT INTO public.students VALUES (31, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (32, 'Mehdi', 'Vandenberghe', 39, 1.9);
INSERT INTO public.students VALUES (33, 'Dejon', 'Howell', 40, 4.0);
INSERT INTO public.students VALUES (34, 'Aliya', 'Gulgowski', 45, 2.6);
INSERT INTO public.students VALUES (35, 'Ana', 'Tupajic', 41, 3.1);
INSERT INTO public.students VALUES (36, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 42, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 45, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 36, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

