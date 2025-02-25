/*
 * FULL JOIN returns all rows from both tables, combining the results of both LEFT JOIN and RIGHT JOIN. Non-matching rows will contain NULL values
 */

/* Example */
SELECT 
  table1.column1,table1.column2,table2.column1
FROM 
  table1
FULL JOIN 
  table2
ON 
  table1.matching_column = table2.matching_column;
