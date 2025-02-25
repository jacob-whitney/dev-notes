/*
 * Correlated subquery depends on values
from the outer query. Unlike an inline subquery, a correlated
subquery is evaluated once for each row processed by the
outer query.
 */

 /* Example */
 /* The subquery (SELECT MAX(Quantity) ... ) finds the maximum number of movies rented in each rental.*/
/* The outer query retrieves the names of customers who made those rentals. */
SELECT 
  CustomerName
FROM 
  Rentals R
WHERE 
  Quantity = (SELECT MAX(Quantity)
              FROM RentalDetails RD
              WHERE R.RentalID = RD.RentalID);