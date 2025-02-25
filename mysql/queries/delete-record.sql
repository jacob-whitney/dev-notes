/*
 * Delete a record
 */

DELETE FROM 
  <database>.<table> 
WHERE 
  <column> = <value>;

/* Example */
DELETE FROM 
  patron_sms_reminders.sendlog 
WHERE 
  patron_id = 'P024515116';