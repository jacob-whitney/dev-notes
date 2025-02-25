/*
 * HAVING command is used instead of WHERE with aggregate functions
 */

SELECT 
  CustomerName, COUNT(RentalID) AS TotalRentals
FROM 
  Rentals
GROUP BY 
  CustomerName
HAVING 
  COUNT(RentalID) > 1;
