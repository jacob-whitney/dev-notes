`cut`

### Description

Print one or more column from a file.

### Notes

- ``-f`` | Defines a column as strings separated by a single tab character
- Ex: ``cut -f2 columns.txt`` | Prints the second column in *columns.txt* 
- Ex: ``cut -f1,3 columns.txt`` | Prints the first and third columns in *columns.txt*
- ``-c`` | Defines a column by character position
- Ex: ``cut -c1-3 columns.txt`` | Prints the first three characters on each line of *columns.txt*
- ``-d`` | Defines a column by delimiter
- Ex: ``cut -d, -f1 columns.txt`` | Shows all characters before "," in the first column of *columns.txt*
    - If the first column is a list of names, like "Smith, John", this command will display the last name (Smith) for each row in the column