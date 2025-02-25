/*
 * Compare two tables
 */

SELECT 
  * 
FROM 
  <database1>.<table>
EXCEPT 
SELECT 
  * 
FROM 
  <database2>.<table>;