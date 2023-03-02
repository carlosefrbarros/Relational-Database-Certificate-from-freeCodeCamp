#Learn SQL by Building a Student Database: Part 2

/*The first thing you need to do is start the terminal. Do that by clicking the "hamburger" menu at the top left of the screen, going to the "terminal" section, and clicking "new terminal". Once you open a new one, type echo hello SQL into the terminal and press enter.*/

echo hello SQL

/*In Part 1 of this tutorial, you created a students database and then a script to insert information about your computer science students into it. Log into the psql interactive terminal with psql --username=freecodecamp --dbname=postgres to see if it's here.*/

psql --username=freecodecamp --dbname=postgres

/*List the databases.*/

\l

/*Your database isn't here. You can use the .sql file you created at the end of Part 1 to rebuild it. I recommend "splitting" the terminal. You can do that by clicking the "hamburger" menu at the top left of the window, going to the "Terminal" menu, and clicking "Split Terminal". Once you've done that, enter psql -U postgres < students.sql in it to rebuild the database.*/

psql -U postgres < students.sql

/*A lot of stuff happened in the terminal. That looks promising. In the psql prompt, view the databases again.*/

\l

/*There's your students database. Connect to it.*/

\c students;

/*Now that you're connected. Display the tables and relations that are here to see if it's all correct.*/

\d

/*That all looks right. View the details of the students table to make sure the stucture is right.*/

\d students;

/*Looks good. Make sure all the data is in the table, as well.*/

select * from students;

/*The data is all there. You should take a look at the details of the other tables and the data in them to make sure they look good. When you are done, use touch in the bash terminal to create student_info.sh. You are going to make a script to print info about your students.*/

select * from majors;
select * from courses;
select * from majors_courses;

touch student_info.sh

/*Give your new file executable permissions.*/

chmod +x student_info.sh

/*Add a shebang that uses bash at the top of your new script.*/

#!/bin/bash

/*Below the shebang, add a comment that says Info about my computer science students from students database.*/

#Info about my computer science students from students database

/*In the new script, use echo to print ~~ My Computer Science Students ~~. Use the -e flag with it to put a new line at the beginning and end of the text.*/

echo -e "\n~~ My Computer Science Students ~~\n"

/*Run the script to make sure it's working.*/

./student_info.sh

/*You will want to query the database again to get info about the students to display. Add the same PSQL variable you use in your insert_data.sh script. It looked like this: PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"*/

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

/*Below the PSQL variable you just added, use echo to print First name, last name, and GPA of students with a 4.0 GPA:. Use the -e flag to put a new line at the beginning of the sentence.*/

echo -e "\nFirst name, last name, and GPA of students with a 4.0 GPA:"

/*You will want to print what that sentence is asking for. You should know how to make that query, but lets practice a little first. SQL stands for "Structured Query Language". It's the language you have been using to manage your relational databases. In the psql prompt, view all the data in the students table like you have done many times.*/

select * from students;

/*You should look at the column titles that were returned. The * gets all columns in a table with your query. You can return specific columns by putting the column name in the query instead of *. In the psql prompt, view just the first_name column from the students table.*/

select first_name from students;

/*Just the first_name column was returned that time. You can specify as many columns you want returned by separating them with commas. View the first_name, last_name and gpa columns from the students table.*/

select first_name, last_name, gpa from students;

/*You can return only rows you want by adding WHERE <condition> to your query. A condition can consist of a column, an operator, and a value. Use one of these to view the same columns as before but only rows WHERE gpa < 2.5.*/

select first_name, last_name, gpa from students where gpa < '2.5';

/*The < only return rows where the gpa column was less than 2.5. Some other operators are: <, >, <=, >=. View the same columns, but only rows for students with a gpa greater than or equal to 3.8.*/

select first_name, last_name, gpa from students where gpa >= '.8';

/*That only returned students with a GPA of 3.8 or better. There's equal (=) and not equal (!=) operators as well. View the same columns for students that don't have a 4.0 gpa.*/

select first_name, last_name, gpa from students where gpa != 4.0;

/*The right query will get you only the data you are looking for. Back in your student_info.sh file, add an echo command to the bottom that prints what the sentence above it asks for. Place double quotes around it like this: echo "$($PSQL "<query_here>")". This will make it so the output isn't all on one line.*/

echo "$($PSQL "select first_name, last_name, gpa from students where gpa = 4.0")"

/*Run the script to see your students with the highest GPA's.*/

./student_info.sh

/*Add another echo statement at the bottom of the script. Make it print All course names whose first letter is before 'D' in the alphabet:. Put a new line in front of it like the first sentence.*/

echo -e "\nAll course names whose first letter is before 'D' in the alphabet:"

/*Practice first. In the psql prompt, view all the data in the majors table.*/

select * from majors;

/*The operators you used with numbers in the last section can be used on text as well. Use the = to view all majors named Game Design. Don't forget that You need single quotes around text values.*/

select * from majors where major = 'Game Design';

/*Next, view all the rows not equal to Game Design.*/

select * from majors where major != 'Game Design';

/*Use the greater than operator to see majors that come after it alphabetically.*/

select * from majors where major > 'Game Design';

/*Game Design was not included in the results because it is not > 'Game Design'. Try it with the greater than or equal to operator.*/

select * from majors where major >= 'Game Design';

/*It included Game Design in the results that time. So if you want to see results that start with a G or after, you could use major >= 'G'. View the majors that come before G.*/

select * from majors where major < 'G';

/*In your script, add an echo at the bottom to print the suggested info like you did before. Make sure to use double quotes where needed.*/

echo "$($PSQL "select course from courses where course < 'D'")"

/*Run the script to see what course names come before the letter D.*/

./student_info.sh

/*Looks like there is five of them. Add another sentence like the others that says: First name, last name, and GPA of students whose last name begins with an 'R' or after and have a GPA greater than 3.8 or less than 2.0:*/

echo -e "\nFirst name, last name, and GPA of students whose last name begins with an 'R' or after and have a GPA greater than 3.8 or less than 2.0:"

/*To find that, start by using the psql prompt to view all the data in the students table.*/

select * from students;

/*It returned 31 rows. Use the same command, but only return the rows for students whose last name comes before M in the alphabet.*/

select * from students where last_name < 'M';

/*That returned 18 rows. You can use multiple conditions after WHERE with AND or OR, among others. Just add the keyword and another condition. In the psql prompt, use the same command as before, but add an OR to also return rows of students with a 3.9 GPA.*/

select * from students where last_name < 'M' or gpa = '3.9';

/*It showed rows where one of the conditions was true, there was one more than last time. Enter the previous command, but use AND to view only students that meet both conditions.*/

select * from students where last_name < 'M' and gpa = '3.9';

/*Now it only shows rows where both conditions are true, one person. Enter the previous command, but add a third condition of OR gpa < 2.3.*/

select * from students where last_name < 'M' and gpa = '3.9' or gpa < '2.3';

/*This showed all students whose GPA is less than 2.3 because the final OR condition was true for them. It didn't matter what their last name started with. You can group conditions together with parenthesis like this: WHERE <condition_1> AND (<condition_2> OR <condition_2>). This would only return rows where <condition_1> is true and one of the others is true. View students whose last name is before M that have a GPA of 3.9 or less than 2.3.*/

select * from students where last_name < 'M' and (gpa = '3.9' or gpa < '2.3');

/*Two students meet those conditions. Back in the student info file, add an echo command at the bottom to print the suggested rows.*/

echo "$($PSQL "select first_name, last_name, gpa from students where last_name >= 'R' and (gpa > '3.8' or gpa < '2.0')")"

/*Run the script to see the results.*/

./student_info.sh

/*Moving along. Add another echo command, like the others, with a sentence that says: Last name of students whose last name contains a case insensitive 'sa' or have an 'r' as the second to last letter:*/

echo -e "\nLast name of students whose last name contains a case insensitive 'sa' or have an 'r' as the second to last letter:"

/*Start by viewing everything from the courses table in the psql prompt to see how you might be able to find this out.*/

select * from courses;

/*There's a few that contain the word Algorithms. You can use LIKE to find patterns in text like this: WHERE <column> LIKE '<pattern>'. An underscore (_) in a pattern will return rows that have any character in that spot. View the rows in this table with a course name that matches the pattern '_lgorithms'.*/

select * from courses where course like '_lgorithms';

/*That pattern matched only rows that had exactly one character, followed by lgorithms. Another pattern character is %. It means anything can be there. To find names that start with W, you could use W%. View the courses that end in lgorithms.*/

select * from courses where course like '%lgorithms';

/*It found two that time. Try viewing courses that start with Web.*/

select * from course where course like 'Web%';

/*Combine the two pattern matching characters to show courses that have a second letter of e.*/

select * from courses where course like '_e%';

/*Nice job! Try viewing the courses with a space in their names.*/

select * from courses where course like '% %';

/*There they are. You can use NOT LIKE to find things that don't match a pattern. View courses that don't contain a space.*/

select * from courses where course not like '% %';

/*Five courses without a space. Try finding the ones that contain an A.*/

select * from courses where course like '%A%';

/*6 rows. This showed all the courses with a capital A. ILIKE will ignore the case of the letters when matching. Use it to see the courses with an A or a.*/

select * from courses where course ilike '%A%';

/*It found 11 rows that time. You can put NOT in front of ILIKE as well. Use it to see the courses that don't contain an A or a.*/

select * from courses where course not ilike '%A%';

/*You combine these like any other conditions. View the courses that don't have a capital or lowercase A and have a space.*/

select * from courses where course not ilike '%A%' and course like '% %';

/*In your student info script, add an echo statement at the bottom like the other to print the results of the suggested query.*/

echo "$($PSQL "select last_name from students where last_name ilike '%sa%' or last_name like '%r_'")"

/*Run the script to see the results.*/

./student_info.sh

/*Looks like five students meet those conditions. Add another echo command at the bottom, like the others. Make this one say: First name, last name, and GPA of students who have not selected a major and either their first name begins with 'D' or they have a GPA greater than 3.0:*/

echo -e "\nFirst name, last name, and GPA of students who have not selected a major and either their first name begins with 'D' or they have a GPA greater than 3.0:"

/*Start by looking at all the data in the students table.*/

select * from students;

/*All the fields that are empty or blank are null. You can access them using IS NULL as a condition like this: WHERE <column> IS NULL. View the students who don't have a GPA.*/

select * from students where gpa is null;

/*Inversely, you can use IS NOT NULL to see rows that aren't null. View all the info on students that do have a GPA.*/

select * from students where gpa is not null;

/*View all the info on students who haven't chosen a major.*/

select * from students where major_id is null;

/*View the students who don't have a major, but don't include students without a GPA.*/

select * from students where major_id is null and gpa is not null;

/*One more. View the students who don't have a major and gpa.*/

select * from students where major_id is null and gpa is null;

/*In your script, add an echo command at the bottom to print the results the sentence is looking for.*/

echo "$($PSQL "select first_name, last_name, gpa from students where major_id is null and (first_name like 'D%' or gpa > '3.0')")"

/*Run the script to see the students that meet those conditions.*/

./student_info.sh

/*There's three of them. Add another sentence, like the others that says Course name of the first five courses, in reverse alphabetical order, that have an 'e' as the second letter or end with an 's':*/

echo -e "\nCourse name of the first five courses, in reverse alphabetical order, that have an 'e' as the second letter or end with an 's':"

/*You can specify the order you want your results to be in by adding ORDER BY <column_name> at the end of a query. In the psql prompt, view all the info in the students table in order by the GPA's.*/

select * from students order by gpa;

/*That put the lowest GPA's at the top. When using ORDER BY, it will be in ascending (ASC) order by default. Add DESC (descending) at the end of the last query to put the highest ones at the top.*/

