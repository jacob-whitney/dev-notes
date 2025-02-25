/*
 * RIGHT JOIN returns all records from the right table and the matched records from the left table
 */

/* Example */
SELECT 
  table1.column1, table2.column1
FROM 
  table1
RIGHT JOIN 
  table2 
ON 
  table1.column = table2.column;