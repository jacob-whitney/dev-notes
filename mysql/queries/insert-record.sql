/*
 * Insert record into table
 * - Important to use single quotes for strings in MySQL
 */

INSERT INTO <table> (field1, field2, field3)
VALUES (val1, val2, val3)

/* Example */
INSERT INTO subjects (menu_name, position, visible)
VALUES 
    ('Math', 1, 1),
    ('Science', 2, 1),
    ('History', 3, 0);