/*
 * Search table column for specific string
 * - % means wildcard
 */

SELECT 
  * 
FROM 
  <database>.<table> 
WHERE 
  <column> LIKE 'string';

/* Example */
SELECT 
  * 
FROM 
  incidents.incident 
WHERE 
  sname LIKE "jacob%";