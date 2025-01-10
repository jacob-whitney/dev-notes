#! /usr/bin/bash

echo "Let's create a user, complete the following details."

echo "What is the user's first name?"
# take user input for first name

echo "What is the user's last name?"
# take user input for last name

echo "What username would you like to use?"
# take user input for username

echo "What will be your user password?"
# take user input for password

useradd -s /bin/bash -m -c "[first-name] [last-name]" [username]

echo "What groups should this user be added to?"
# take multiple user inputs for groups with commas or ENTER
# Usually sudo and www-data

# For each group
usermod -a -G [group] [username]
