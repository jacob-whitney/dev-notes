/*
 * Create table
 * - NOT NULL means fields in that column cannot be empty in any records
 * - AUTO_INCREMENT automatically makes the next record 1 more than the previous record
 */

CREATE TABLE <table> (
<field> <TYPE>(<max-characters>) <CONFIGURATIONS>
);

/* Example */
CREATE TABLE subjects (
  id INT(11) NOT NULL AUTO_INCREMENT,
  menu_name VARCHAR(255),
  position INT(3),
  visible TINYINT(1),
  PRIMARY KEY (id)
);