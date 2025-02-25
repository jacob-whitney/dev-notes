/*
 * Export selected tables into a CSV file
 */

SELECT 
  *
INTO OUTFILE 
  '/path/to/outputfile.csv'
FIELDS TERMINATED BY 
  ','
ENCLOSED BY 
  '"'
LINES TERMINATED BY 
  '\n'
FROM 
  <table>;

  /* Example */
SELECT 
  *
INTO OUTFILE 
  '/home/jwhitney/exports/employees-2024-07-03.csv'
FIELDS TERMINATED BY 
  ','
ENCLOSED BY 
  '"'
LINES TERMINATED BY 
  '\n'
FROM 
  ocls_system.sys_emps;