# MySQL

> Linux commands are in single line code: ``mysql -V``  
> MySQL queries are in multi-line code:
> ```
> SELECT user,host FROM mysql.user;
> ```
> or
> ```
> SELECT
>   user,
>   host,
> FROM
>   mysql.user;
> ```


## Access & Config

``mysql -V`` | Check MySQL version

``sudo mysql`` | Login as root

``mysql -u <username> -p`` | Login as user
- ``-u`` | Username flag
- ``-p`` | Password flag, will prompt password if nothing follows flag
- ``-P`` | Port number flag
- Ex: ``mysql -u jwhitney -P 3308 -p`` | Login to local MySQL instance from port 3308


## Manage Users

Show all database users
```
SELECT 
  user,
  host 
FROM 
  mysql.user;
```

Show current user
```
SELECT user();
```

Create user
```
CREATE USER 'jwhitney'@'localhost';
```

Change username or host
```
RENAME USER 
  'jwhitney@'localhost' 
TO 
  'jacobw'@'127.0.0.1';
```

Change password for current user
```
SET PASSWORD = '<password>';
```

Change password for a specific user
```
SET PASSWORD FOR '<username>'@'<host>' = '<password>';
```

Show privileges of existing user
```
SHOW GRANTS FOR '<username>'@'<host>';
```

Grant privileges of a database to single user
- If the user already exists, leave out ``'<password>'``. For new users, this is where we create their password.
```
GRANT ALL PRIVILEGES ON 
  <database-name>.*
TO 
  '<username>'@'<host>'
IDENTIFIED BY 
  '<password>';
```


Grant a privilege globally to single user
```
GRANT <PRIVILEGE> ON 
  *.*
TO 
  '<username>'@'<host>';
```
```
# Example
GRANT PROCESS ON 
  *.* 
TO '
  jwhitney'@'localhost';
```

Delete user
```
DROP USER 'jwhitney'@'localhost';
```


## Global Settings

View current sql_mode globally
```
SELECT @@GLOBAL.sql_mode;

```

View current sql_mode in session
```
SELECT @@SESSION.sql_mode;
```

Disable strict sql_mode and no zero in date
```
SET GLOBAL sql_mode = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
```


## View and Edit Databases

Show all databases
```
SHOW DATABASES;
```

Create a database
```
CREATE DATABASE <database>;
```

Switch to a database
```
USE <database>;
```

Show which database is currently selected
```
SELECT DATABASE();
```

Delete a database and all it's data
- WARNING: Very powerful and all data is instantaneously removed
```
DROP DATABASE <database>;
```


## View Table Data

Show tables in a database
- When database is already selected
```
SHOW TABLES;
```

Show all table columns
```
DESC <database>.<table>;
```
```
# Example
DESC mysql.user;
```

Show table column details
```
SHOW COLUMNS FROM <table>;
```

Count rows in a table
```
SELECT COUNT(*) FROM <database>.<table>;
```
```
# Example
SELECT COUNT(*) FROM patron_sms_reminders.patrons;
```

Search table column for specific string
- ``%`` means wildcard
```
SELECT 
  * 
FROM 
  <database>.<table> 
WHERE 
  <column> LIKE 'string';
```
```
# Example
SELECT 
  * 
FROM 
  incidents.incident 
WHERE 
  sname LIKE "jacob%";
```

Search for entries between two values
```
SELECT 
  * 
FROM 
  <database>.<table> 
WHERE 
  <column> BETWEEN 10 AND 20;
```

Sort by ascending, order lowest to highest
```
SELECT 
  * 
FROM 
  <database>.<table> 
ORDER BY 
  <column> ASC;
```

Sort by descending, order highest to lowest
```
SELECT 
  * 
FROM 
  <database>.<table> 
ORDER BY 
  <column> DESC;
```

Compare two tables
```
SELECT 
  * 
FROM 
  <database1>.<table>
EXCEPT 
SELECT 
  * 
FROM 
  <database2>.<table>;
```

Select unique data from a table column. No duplicates
```
SELECT DISTINCT 
  <column-field> 
FROM 
  <table>;
```

Limit number of rows shown
```
LIMIT <integer>;
```
```
# Example limit of 10 rows
SELECT 
  * 
FROM 
  ocls.wp_posts 
LIMIT 10;
```

### Resources

[Epoch Timestamp Converter](https://www.epochconverter.com/)


## Join Tables 

``INNER JOIN`` | Returns records that have matching values in both tables

Shows only posts that have taxonomy terms selected
```
# Example
SELECT 
  wp_posts.ID, 
  wp_posts.post_title,
  wp_term_relationships.term_taxonomy_id
FROM 
  wp_posts 
INNER JOIN 
  wp_term_relationships ON wp_posts.ID = wp_term_relationships.object_id
WHERE 
  wp_posts.ID=4140 OR wp_posts.ID=160595;
  ```

``LEFT JOIN`` | Returns all records from the left table and the matched records from the right table

Shows all posts whether they have taxonomy terms selected or not
```
# Example
SELECT 
  wp_posts.ID, 
  wp_posts.post_title,
  wp_term_relationships.term_taxonomy_id
FROM 
  wp_posts 
LEFT JOIN 
  wp_term_relationships ON wp_posts.ID = wp_term_relationships.object_id
WHERE 
  wp_posts.ID=4140 OR wp_posts.ID=160595;
```

``RIGHT JOIN`` | Returns all records from the right table and the matched records from the left table

``CROSS JOIN`` | Returns all records from both tables

### Resources

[MySQL Joins](https://www.w3schools.com/mysql/mysql_join.asp) from W3Schools


## Export Tables
Export selected tables into a CSV file

```
SELECT 
  *
INTO OUTFILE 
  '/path/to/outputfile.csv'
FIELDS TERMINATED BY 
  ','
ENCLOSED BY 
  '"'
LINES TERMINATED BY 
  '\n'
FROM 
  <table>;
```
```
# Example
SELECT 
  *
INTO OUTFILE 
  '/home/jwhitney/exports/employees-2024-07-03.csv'
FIELDS TERMINATED BY 
  ','
ENCLOSED BY 
  '"'
LINES TERMINATED BY 
  '\n'
FROM 
  ocls_system.sys_emps;
```


## Change Tables

Create table
- ``NOT NULL`` | Field cannot be empty in any records
- ``AUTO_INCREMENT`` | Automatically make the next record 1 more than the previous record
```
CREATE TABLE <table> (
<field> <TYPE>(<max-characters>) <CONFIGURATIONS>
);
```
```
# Example
CREATE TABLE subjects (
  id INT(11) NOT NULL AUTO_INCREMENT,
  menu_name VARCHAR(255),
  position INT(3),
  visible TINYINT(1),
  PRIMARY KEY (id)
);
```

Insert record into table
- Important to use single quotes for strings in MySQL
```
INSERT INTO <table> (field1, field2, field3)
VALUES (val1, val2, val3)
```
```
# Example
INSERT INTO subjects (menu_name, position, visible)
VALUES 
    ('Math', 1, 1),
    ('Science', 2, 1),
    ('History', 3, 0);
```

Update record in a table
```
UPDATE 
  <table>
SET 
  col1 = '<string>', 
  col2 = '<string>'
WHERE 
  id=<integer>
```

Replace part of a value's string
```
UPDATE
    <table>
SET
    <column> = REPLACE(<column>, '<original-string>', '<new-string>')
WHERE
    <column> = <value>;
```
```
# Examples
# Replaces domain for all emails in email column
UPDATE
    employee
SET
    email = REPLACE(email, 'placeholder.com', 'jacobwhitney.org');

# Replaces hyphens with slashes for a single value
# So "FQ-543-2A" becomes FQ/543/2A
UPDATE
    parts
SET
    part_number = REPLACE(part_number, '-', '/')
WHERE
    part_id = 245;
```
- Resource: [How to Replace Part of String in MySQL](https://www.geeksforgeeks.org/how-to-replace-part-of-a-string-in-mysql/) from Geeks for Geeks

Delete a row
```
DELETE FROM 
  <database>.<table> 
WHERE 
  <column> = <value>;
```
```
# Example
DELETE FROM 
  patron_sms_reminders.sendlog 
WHERE 
  patron_id = 'P024515116';
```

Duplicate a table
```
CREATE TABLE 
  <new_table> 
AS SELECT 
  * 
FROM 
  <original_table>;
```

### Resources

[Symbol Cheat Sheet](https://www.sisense.com/blog/sql-symbol-cheatsheet/)  
<img src="../images/mysqli-and-pdo.png" alt="Table of software that uses mysqli or PDO" width="500">

!INCOMPLETE checkout setting MySQL modes permanently


## MySQL Shell

``mysqlsh -u <username> -p`` | Login to MySQL Shell for running global object functions like ``util``

``> util.help()`` | Get help with util global object

``> util.check_for_server_upgrade`` | Check for compatibility issues for upgrade to MySQL. Used in python version of shell