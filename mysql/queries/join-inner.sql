/*
 * INNER JOIN returns records that have matching values in both tables
 */

 /* Example */
 /* Shows only posts that have taxonomy terms selected */
SELECT 
  wp_posts.ID, 
  wp_posts.post_title,
  wp_term_relationships.term_taxonomy_id
FROM 
  wp_posts 
INNER JOIN 
  wp_term_relationships ON wp_posts.ID = wp_term_relationships.object_id
WHERE 
  wp_posts.ID=4140 OR wp_posts.ID=160595;

/* Example */
SELECT 
  columns
FROM 
  table1
INNER JOIN 
  table2
ON 
  table1.column = table2.column;
