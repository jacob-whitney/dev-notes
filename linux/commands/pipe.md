``<output-command> | <output-handler-command>``

### Description

``|`` called 'pipe' combines commands where the first command outputs text and the second command performs an additional handler or process of the output

### Notes

- Ex: ``cat file.txt | grep "hello"`` | Searches output of *file.txt*'s contents and searches for the string "hello"
- Ex: ``ll /etc/apache2 | less`` | Lists the contents of the */etc/apache2* directory in `less` format, allowing user to scroll through the long list of files and directories