/*
 * Group a result set
 */

 /* Example */
SELECT 
  CustomerName, COUNT(RentalID) AS TotalRentals
FROM 
  Rentals
GROUP BY 
  CustomerName;
