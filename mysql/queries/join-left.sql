/*
 * LEFT JOIN returns all records from the left table and the matched records from the right table
 */

 /* Example */
 /* Shows all posts whether they have taxonomy terms selected or not */
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

/* Example */
SELECT 
  table1.column1, table2.column1
FROM 
  table1
LEFT JOIN 
  table2 
ON 
  table1.column = table2.column;