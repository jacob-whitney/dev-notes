/*
 * Show all database users
 */

SELECT 
  user,
  host 
FROM 
  mysql.user;