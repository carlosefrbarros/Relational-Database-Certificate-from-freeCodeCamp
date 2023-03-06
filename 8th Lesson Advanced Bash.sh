#Learn Advanced Bash by Building a Kitty Ipsum Translator

#The first thing you need to do is start the terminal. Do that by clicking the "hamburger" menu at the top left of the screen, going to the "terminal" section, and clicking "new terminal". Once you open a new one, type echo hello bash into the terminal and press enter.

echo hello bash

#The command you just entered printed to the terminal. You can redirect that output to a file using >. Here’s an example: <command> > <filename>. Enter the same command but redirect the output into stdout.txt.

echo hello bash > stdout.txt

#A stdout.txt file was created. You should take a look at it. Instead of printing hello bash to the terminal, it redirected the output to the file. A single > will create or overwrite the file. Use the same command with >> to append to the file.

echo hello bash >> stdout.txt

#Take a look at the file again. The output of echo hello bash was added to it.Use the command with one > again to overwrite the file.

echo hello bash > stdout.txt

#Take a look at the file. It was overwritten with the output of the command. Enter > stdout.txt in the terminal to redirect nothing into the file. Effectively, emptying it.

 > stdout.txt

 #Next, enter bad_command in the terminal to see what happens. You will get an error.

 bad_command

 #Enter the same command, but try to redirect the output to stderr.txt using >.

 bad_command > stderr.txt

 #There’s two types of output, stdout (standard out) for when a command is successful, and stderr (standard error) for when it’s not. Both of these will print to the terminal by default. bad_command was not a valid command, so it printed to stderr. You can redirect stderr with 2>. Enter the same command but redirect stderr to stderr.txt

 bad_command 2> stderr.txt

 #Take a look at the stderr.txt file. The error was redirected to the file and nothing printed in the terminal. You used 2> to redirect stderr. Similarily, you can use 1> to redirect stdout. Enter echo hello bash again and use it to redirect stdout to the stdout.txt file.

 echo hello bash 1> stdout.txt

 #stdout and stderr are for output. stdin (standard in) is the third thing commands can use and is for getting input. The default is the keyboard. Enter read NAME in the terminal to see a command that uses stdin.

 read NAME

 #The read command is looking at stdin for where to get input, which is pointing to the keyboard. Type your name and press enter.

 #Use echo to print the variable you just created.

 echo $NAME

 #Use echo to print the NAME variable again, but redirect the stdout to stdout.txt so it overwrites the file.

 echo $NAME > stdout.txt

 #Use echo and redirection to put the text freeCodeCamp in a name.txt file for some more testing. Remember that it will create the file if it doesn't exist.

 echo freeCodeCamp > name.txt

 #Just like you can redirect output, you can redirect stdin as well. Here's an example: <command> < <filename_for_stdin>. Use the read command to assign the NAME variable to the contents of name.txt by redirecting the stdin.

read NAME < name.txt

#stdin was pointing to the name.txt file this time. Use echo to print the NAME variable again.

echo $NAME

#Now the variable is set to the content of the file, which was the input. Another way to set the stdin is by using the pipe (|). It will use the output from one command as input for another. Here's an example: <command_1> | <command_2>. This will take the stdout from command_1 and use it as the stdin for command_2. Use this method to echo your name and pipe the output into the read command which reads your name into the NAME variable.

echo Carlos | read NAME

#Use echo to print the variable again.

echo $NAME

#It worked, but it doesn't look like it. When you used the pipe (|) to set the input for read, it ran the command in a subshell or subprocess. Basically, another terminal instance within the one you see. The variable was set in there and didn't affect the one you had previously set. cat is another command that takes input. Enter it in the terminal.

cat

#cat will print the contents of a file or input to stdout. You didn't specify any input for the command. Feel free to type something and press enter. When you are done, press control+c to finish the command.

#cat can take a filename as an argument. Use it again with your name.txt file as an arguement to print the contents of the file.

cat name.txt

#Enter the same command but use redirection to set the stdin to name.txt

cat < name.txt

#Use echo to print your name and pipe the output into the cat command.

echo Carlos | cat

#You should be starting to get the hang of how stdin, stdout, and stderr work but let's try another example with your own command. Use touch to create a file named script.sh.

touch script.sh

#Give your new script executable permissions with the chmod command and the +x flag.

chmod +x script.sh

#This will be a very simple script with only a few commands. At the top of file, add a shebang that looks like this: #!/bin/bash.

#!/bin/bash

#Below the shebang, add a read command that reads input into a NAME variable.

read NAME

#Below that, use echo to print Hello <name> using the variable.

echo Hello $NAME

#One more thing. Add bad_command at the bottom of the file.

bad_command

#Your script takes input from stdin and will output to stdout and stderr. Run your script and don't input anything for now.

./script.sh

#The read command in your script is waiting for input. Type your name and press enter.

#You input your name, and your script output the result of the two commands. Run the script again, but use a pipe to echo your name as the input.

echo Carlos | ./script.sh

#It didn't ask for input this time because you gave it input with the pipe. The two types of output were printed in the terminal. Run the same command but redirect stderr output to the stderr.txt

echo Carlos | ./script.sh 2> stderr.txt

#Again, it didn't ask for input. This time it only printed your name to the terminal and not the output of bad_command. That produced an error, which you redirected to stderr.txt. Take a look at that file. You can redirect both the stderr and stdout by adding another redirection at the end like this: > <filename>. Enter the same command, redirect the stderr to the same place again, and the stdout to stdout.txt.

echo Carlos | ./script.sh 2> stderr.txt > stdout.txt

#It didn't ask for input and nothing was printed in the terminal that time. You redirected both outputs to files. You should take a look at them to see if they have what you expected. Run your script again, use redirection to set name.txt as the input. Don't redirect any of the output.

./script.sh < name.txt

#Excellent. Run the same command, but redirect the stderr to stderr.txt.

./script.sh < name.txt 2> stderr.txt

#Nice job! Run it again, redirect the stderr to the same place and the stdout to stdout.txt

./script.sh < name.txt 2> stderr.txt > stdout.txt

#😄 You have two kitty_ipsum files. Find out what's in them by printing the first one in the terminal with cat.

cat kitty_ipsum_1.txt

#It's some kitty ipsum. You may enjoy reading it 😄 Look at the second one with cat like you did this one.

cat kitty_ipsum_2.txt

#You will write a small script to translate both of them into doggy ipsum. For now, you will learn some commands to figure out how. The first one is wc. It prints some info about a file. It can take a file as an argument like the cat command. Use it to see what it shows you about your kitty_ipsum_1.txt file.

wc kitty_ipsum_1.txt

#Not quite sure what all those numbers mean. Check the manual of the wc command to see if you can find out more.

man wc

#wc stands for word count. It showed you how many lines were in the file, how many words, and how many bytes. Use the -l flag to only output how many lines are in the file. Don't do any redirecting of input or output.

wc -l kitty_ipsum_1.txt

#The file has 27 lines. Check how many words are in the file.

wc -w kitty_ipsum_1.txt

#332 words are in the kitty_ipsum_1.txt file. Lastly, check how many characters it has.

wc -m kitty_ipsum_1.txt

#Use the command without any flags to see if the numbers are the same.

wc kitty_ipsum_1.txt

#That shows the byte count instead of the character count. Some characters must be more than one byte. Use cat to pipe the content of the file as the input of the wc command to see if the output is the same.

cat kitty_ipsum_1.txt | wc

#It looks like the way you give input to a command may affect the output. It only printed the numbers that time and not the filename. Try using redirection as the input with the same file and command to see what that outputs.

wc < kitty_ipsum_1.txt

#No filename again with fewer spaces that time. You may have to play with certain commands to get the output you are looking for. You are going to create a file that has some meta information about the two kitty ipsum files in it. Use echo and redirection to print ~~ kitty_ipsum_1.txt info ~~ to a file named kitty_info.txt. Make sure to place the text in quotes.

echo "~~ kitty_ipsum_1.txt info ~~" > kitty_info.txt

#Open the file so you can keep track of what's in it. Use echo and the -e flag with the new line character (\n) to append Number of lines: to the kitty_info.txt file. Add the new line character at the beginning of the text so there's an empty line. Remember that you can append output to a file with >>.

echo -e "\nNumber of lines:" >> kitty_info.txt

#You should be able to find out how many lines are in the kitty_ipsum_1.txt file and add that number to the kitty_info.txt file. Use the cat command to pipe the content of kitty_ipsum_1.txt as input for the wc command. Use the flag for getting the number of lines from that input and append the number to the kitty_info.txt file. Tip: enter the command without appending to see if it's working first.

cat kitty_ipsum_1.txt | wc -l >> kitty_info.txt

#Next, you want to put a word count of the file in the info. Use echo again to append Number of words: to kitty_info.txt. Put a new line in front of the text like you did for the first one.

echo -e "\nNumber of words:" >> kitty_info.txt

#Use cat and the pipe method again to append the number of words in kitty_ipsum_1.txt to kitty_info.txt.

cat kitty_ipsum_1.txt | wc -w >> kitty_info.txt

#Next, you want to add the number of characters. Use the echo command with redirection to append Number of characters:, with a new line in front of it, to kitty_info.txt like you did with the other sentences.

echo -e "\nNumber of characters:" >> kitty_info.txt

#Append the number of characters in kitty_ipsum_1.txt to kitty_info.txt. Use the redirection method as the input for the wc command this time instead of the piping method.

wc -m < kitty_ipsum_1.txt >> kitty_info.txt

#grep is a command for searching for patterns in text. You can use it like this: grep '<pattern>' <filename>. Use it to search for the pattern meow in the kitty_ipsum_1.txt file.

grep 'meow' kitty_ipsum_1.txt

#It showed you all the lines that contain meow somewhere in them, but it’s a little messy. View the manual of grep to see if you can find anything to help.

man grep

#That's a lot of options. Use grep to search for the meow pattern in the same file, but add that --color flag to see if it's a little more helpful.

grep --color 'meow' kitty_ipsum_1.txt

#That’s better. Add the flag to show all the line numbers with the command.

grep --color -n 'meow' kitty_ipsum_1.txt

#It's showing the line number of each match it found. grep can use regular expressions, too. Enter the previous command, but change the pattern to meow[a-z]* to see all words that start with meow.

grep --color -n 'meow[a-z]*' kitty_ipsum_1.txt

#Looking at the output, you can see that it matched meow and meowzer, instead of just meow. Use the echo command and redirection to append the text Number of times meow or meowzer appears:, with a new line in front of it, to the kitty_info.txt file.

echo -e "\nNumber of times meow or meowzer appears:" >> kitty_info.txt

#So how can you find how many times those two words appear? Use grep to find the meow[a-z]* pattern in the file again to see how many times they appear. Add the --color flag to the command.

grep --color 'meow[a-z]*' kitty_ipsum_1.txt

#It looks like seven, but how can you get a count of that from the command line to append to the info file for the next piece of information? grep has a -c flag to give you a count. Enter the last command but use that instead of the --color flag.

grep -c 'meow[a-z]*' kitty_ipsum_1.txt

#That gave you a count of the number lines that the pattern occurred on. Check the manual of grep to see if there's a way to find a count of all the words matched.

man grep

#It doesn't look like that's an option. But there is a -o flag that will says it will put the matches on their own lines. Try that one with that command instead of the -c flag.

grep -o 'meow[a-z]*' kitty_ipsum_1.txt

#That gave you each match on it's own line. You can use the wc command again to get a count of the lines to find out how many matches there are. Pipe the output of the last command into the wc command and use the flag for showing the line count.

grep -o 'meow[a-z]*' kitty_ipsum_1.txt | wc -l

#Awesome. wc counted the lines in the output of the grep. That should be the count for how many times those words appear. Enter the same command but append the number to the kitty_info.txt file.

grep -o 'meow[a-z]*' kitty_ipsum_1.txt | wc -l >> kitty_info.txt

#Append the text Lines that they appear on: to the kitty_info.txt file. Use the echo command with the -e flag again and put a new line in front of the text.

echo -e "\nLines that they appear on:" >> kitty_info.txt

#There was a -n flag with grep to get line numbers. Use it to check the kitty_ipsum_1.txt file for the meow[a-z]* pattern again.

grep -n 'meow[a-z]*' kitty_ipsum_1.txt

#Check the grep manual to see if there's a way to get just the line numbers.

man grep

#There doesn't appear to be a way to just get the line numbers. There's a sed command for replacing text that might work. First, some practice. Use cat to print the name.txt file in the terminal. It should still say freeCodeCamp.

cat name.txt

#sed can replace text like this: sed 's/<pattern_to_replace>/<text_to_replace_it_with>/' <filename>. By default, it won't replace the text in the file. It will output it to stdout. Use it to replace r with 2 in the name.txt file and the output prints to the terminal.

sed 's/r/2/' name.txt | echo

#You can see that it replaced the r with a 2 in freeCodeCamp. Use it again to replace free with f233 in the same way.

