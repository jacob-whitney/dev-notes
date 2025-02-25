/*
 * Return the total sum of a numerical column
 */

/* Example */
/* This query will multiply the quantity of each movie rented by its rental price and sum the total revenue generated from all rentals.*/
SELECT 
  SUM(Quantity * RentalPrice) 
AS 
  TotalRevenue
FROM 
  RentalDetails RD
JOIN 
  Movies M ON RD.MovieID = M.MovieID;