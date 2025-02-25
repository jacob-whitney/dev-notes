/*
 * Replace part of a value's string
 */

UPDATE
    <table>
SET
    <column> = REPLACE(<column>, '<original-string>', '<new-string>')
WHERE
    <column> = <value>;

/* Examples */
/* Replaces domain for all emails in email column */
UPDATE
    employee
SET
    email = REPLACE(email, 'placeholder.com', 'jacobwhitney.org');

/* Replaces hyphens with slashes for a single value */
/* So "FQ-543-2A" becomes FQ/543/2A */
UPDATE
    parts
SET
    part_number = REPLACE(part_number, '-', '/')
WHERE
    part_id = 245;