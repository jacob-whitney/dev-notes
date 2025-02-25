/*
 * An inline or scalar subquery is when the result of the subquery is treated as a condition or selection list for the outer query
 */

 /* Example */
 /* The subquery (SELECT AVG(RentalPrice) FROM Movies) calculates the average rental price. */
/* The outer query retrieves the movies that have a rental price greater than the average */
SELECT 
  Title, RentalPrice
FROM 
  Movies
WHERE 
  RentalPrice > 
    (SELECT AVG(RentalPrice) FROM Movies);