/*
 * Grant privileges of a database to single user
 * - If the user already exists, leave out <password>. For new users, this is where we create their password.
 */

GRANT ALL PRIVILEGES ON 
  <database-name>.*
TO 
  '<username>'@'<host>'
IDENTIFIED BY 
  '<password>';