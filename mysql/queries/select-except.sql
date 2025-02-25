/*
 * Return rows from the first result set that are not in the second.
 */

SELECT 
  <column1> 
FROM 
  <table1>
EXCEPT
SELECT 
  <column1>
FROM 
  <table2>;
