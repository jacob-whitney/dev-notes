/*
 * Combines result sets of two or more queries, eliminating duplicates.
 */

SELECT 
  <column1> 
FROM 
  <table1>
UNION
SELECT 
  <column1> 
FROM 
  <table2>;
