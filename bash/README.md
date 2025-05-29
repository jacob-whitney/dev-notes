# Bash Shell

## General

``exec bash`` or ``exec $SHELL`` | reload bash or ``$SHELL`` variable if you aren't sure what shell you are using

``echo $SHELL`` | Identify which shell you are using
- ``ps`` | Alternative way to show your shell type
  - Example output from ``ps``   
<img src="../images/ps-command.png" alt="Example output of ps command" width="300">

``source /home/<username>/.bashrc`` | Reload your .bashrc file after saving changes

``which <software>`` | Shows home directory of specific software
- Ex: ``which bash`` | Shows where bash lives for shebang statement
- Ex: ``which php`` | Shows where PHP lives


# Scripting

## Starter Template

```
# shebang statement to set path of bash
#! /usr/bin/bash

#####################################################
# Description of what this bash file does
#####################################################

# Change to directory to where you want to make changes
cd /var/www/ocls_wp &&

# List directory contents to see changes
ls -l
```

## Create a New Command Script

1. Create the shell script, ``script.sh`` for example, somewhere in $PATH, typically ``/usr/local/bin``
2. Only root should be able to execute it
   1. ``sudo chown root:root script.sh``
   2. ``sudo chmod u+x script.sh``
   3. ``sudo chmod go-rws script.sh``
3. Allow your user or a group to sudo execute the script
   1. ``sudo visudo``
   2. In the sudoers file, add the following just before the ``includedir`` line
```
# Allow <user-or-group> to execute /usr/local/bin/script.sh
<user-or-group> All=(ALL) NOPASSWD: /usr/local/bin/script.sh
```
4. Test executing the file from any directory on the server
5. To allow a user or group to execute without sudo
   1. ``sudo chown www-data:www-data script.sh``
   2. ``sudo chmod ug+x script.sh``
   3. ``sudo chmod o-rwx script.sh``


## Echo Outputs

Script ``echo-styles.sh`` | Outputs text with different styles
```
#!/bin/bash

# Underline
echo -e "\033[4mUnderlined text\033[0m"

# Italic (if supported)
echo -e "\033[3mItalic text\033[0m"

# Bold
echo -e "\033[1mBold text\033[0m"

# Red text
echo -e "\033[31mRed text\033[0m"

# Bold and green text
echo -e "\033[1;32mBold and green text\033[0m"
```
Outputs:
```
$ echo-styles.sh
# Styles not shown in Markdown
Underlined text
Italic text
Red text
Bold and green text
```

``0`` | Reset

``1`` | Bold

``3`` | Italic, not widely supported

``4`` | Underline


### Text and Background Colors

| Color   | Text Code | BG Code |
|---------|-----------|---------|
| Black   | ``30``    | ``40``  |
| Red     | ``31``    | ``41``  |
| Green   | ``32``    | ``42``  |
| Yellow  | ``33``    | ``43``  |
| Blue    | ``34``    | ``44``  |
| Magenta | ``35``    | ``45``  |
| Cyan    | ``36``    | ``46``  |
| White   | ``37``    | ``47``  |


## Parameters

Bash uses ten positional parameters ``$0`` thorugh ``$9``
- ``$0`` is reserved as the name of the script

Script ``output-script-name.sh`` | Output the name of the script
```
#!/bin/bash
echo $0
```
Outputs:
```
$ output-script-name.sh
/usr/local/bin/script.sh
```

Script ``output-parameter.sh`` | Output a user passed parameter
```
#!/bin/bash
echo $1
```
Outputs:
```
$ output-parameter.sh

$ output-paramter.sh help
help
$ output-parameter.sh help me
help
$ output-parameter.sh "help me"
help me
```

Script ``output-parameters.sh`` | Output multiple user passed parameters
```
#!/bin/bash
echo "Name: $1"
echo "City: $2"
```
Outputs:
```
$ output-parameters.sh jacob orlando
Name: jacob
City: orlando
$ output-parameters.sh "Jacob Whitney" Orlando
Name: Jacob Whitney
City: Orlando
```

### Resources
[Adding Arguments to Bash Scripts](https://www.redhat.com/sysadmin/arguments-options-bash-scripts) from RedHat


## Variables

Script ``variable-basics.sh`` | Define and use variables in bash
```
#!/bin/bash

# Define integer variable
x=1

# Define string variable
y="hello world"

# Print defined variables
echo x
echo " "
echo y
```
Outputs:
```
$ variable-basics.sh
1 hello world
```

Script ``special-variables.sh`` | Define and use special bash variables
```
#!/bin/bash

# ${BASH_SOURCE[0]} always points to current script file
# Note: $0 also refers to executed script, but changes if script is sourced
SCRIPT_NAME=${BASH_SOURCE[0]}
```
Outputs:
```
$ special-variables.sh
special-variables.sh
```

## Loops




## Conditionals

``command &&`` | !INCOMPLETE

Script ``if-else.sh`` | Outputs conditional content if file or directory exists
```
path="content"

if [ -f "$path" ]; then
    echo "$path is a file"
elif [ -d "$path" ]; then
    echo "$path is a directory"
else
    echo "$path does not exist"
fi
```
Outputs:
```
$ if-else.sh

# File exists
content is a file

# Directory exists
content is a directory

# Does not exist
content does not exist
```

## Other
- ``command &&``
- sudoer link
- [Bash Scripting Tutorial](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/) from freeCodeCamp

## Scripting Notes from Nick

- See [WPO-327](https://ocls.atlassian.net/browse/WPO-327) work logs
- See Nick's response from 3.28.24, 9:05 am
> [Yesterday 9:05 AM] Alexander, Nick  
> I have used the sudoers file to give a user like www-data restricted sudo access in cases like this.
> 
> [Yesterday 9:08 AM] Alexander, Nick  
> First, make a small shell script that does the command you want www-data to be able to run:
> 
> #! /bin/bash  
> chown -R www-data:www-data /path/to/some/dir &&  
> chmod -R g+w /path/to/some/dir  
> install that script in /usr/local/bin and make sure it's executable.
>  
> Then you can edit the sudoers file to give www-data sudo access to only that one script.
> 
> [Yesterday 9:12 AM] Alexander, Nick  
> To edit the sudoers file:  
> sudo visudo  
> Then add a line such as this to the bottom of the file:  
> www-data  ALL=(ALL) NOPASSWD: /usr/local/bin/name_of_the_script
>  
> [Yesterday 9:14 AM] Alexander, Nick  
> You would then change the code in your hook, replacing the chown/chmod lines with:  
> sudo /usr/local/bin/name_of_the_script  
> and assuming the hook is executed by www-data, sudo will work for that one command without needing a password.  
> 
> [Yesterday 9:17 AM] Alexander, Nick  
> If the www-data user somehow gets compromised, besides files already owned by www-data, at least www-data user will only be able to chown/chmod the /path/to/some/dir files, and not get access to the entire system.  
> 
> [Yesterday 9:22 AM] Alexander, Nick  
> Here's the first link I clicked through from google:  
> [How To Edit the Sudoers File](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file)  
> You could also read:  
> man sudoers
>  
> [Yesterday 9:24 AM] Alexander, Nick  
> Oh, it's very important that www-data cannot edit the /usr/local/bin/name_of_the_script file!  Make sure that file is owned by root and only writable by root.