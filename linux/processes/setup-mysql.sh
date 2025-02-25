#! /usr/bin/bash

echo "Setting up MySQL server."

echo "First, updating list of apt packages to make sure "
echo "this system has the latest info on available packages. Continue?"
# take user input for yes or no

sudo apt update &&

echo "Installing MySQL-Server. Continue?"
# take user input for yes or no

sudo apt install mysql-server &&

echo "Confirming ssh service is running"

sudo systemctl status mysql &&

echo "Checking network status of server"

sudo ss -tap | grep mysql &&

echo "Logging in to MySQL via root for initial setup"

sudo mysql &&

echo "=== MySQL Interface ==="
echo "Checking existing users"

SELECT user,host FROM mysql.user;

echo "Would you like to create a new user?"
# take user input for yes or no

# if yes
echo "Creating new user. What will their username be?"
# take user input for username

echo "What host will they use?"
# take input for host name

echo "What will their password be?"
# take user input for password

echo "What default privileges should this user have for all databases?"
# list available privileges
# take user input for all privileges to be granted

echo "Creating user..."

CREATE USER '<username>'@'<hostname>';
SET PASSWORD FOR '<username>'@'<host>' = '<password>';
GRANT <PRIVILEGE1>, <PRIVILEGE2> ON *.* TO '<username>'@'<host>';

echo "Please confirm the user is created successfully and with the correct privileges:"

SELECT user,host FROM mysql.user;
SHOW GRANTS FOR '<username>'@'<host>';

echo "Everything look correct?"
# take user input for yes or no

echo "Exiting MySQL interface. Please login again to make any changes you see fit."

exit;

echo "=== End MySQL Interface ==="

echo "Restarting MySQL service to set changes and allow new user login. Continue?"
# take user input for yes or no

sudo systemctl restart mysql

echo "Additional resources:"
echo " - https://ubuntu.com/server/docs/install-and-configure-a-mysql-server"