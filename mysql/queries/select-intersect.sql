/*
 * Return only the rows that are common between two result sets. T
 */

SELECT 
  <column1> , <column2>
FROM 
  <table_names>
WHERE 
  <condition>
INTERSECT
SELECT 
  <column1> , <column2> ....
FROM 
  <table_names>
WHERE 
  <condition>

 