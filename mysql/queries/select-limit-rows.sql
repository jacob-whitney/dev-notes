/*
 * Limit number of rows shown
 */

SELECT 
  * 
FROM 
  <database>.<table> 
ORDER BY 
  <column> LIMIT <integer>;

/* Example */
SELECT 
  * 
FROM 
  ocls.wp_posts 
LIMIT 10;