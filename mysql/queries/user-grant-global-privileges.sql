/*
 * Grant a privilege globally to single user
 */

GRANT <PRIVILEGE> ON 
  *.*
TO 
  '<username>'@'<host>';

/* Example */
GRANT PROCESS ON 
  *.* 
TO '
  jwhitney'@'localhost';