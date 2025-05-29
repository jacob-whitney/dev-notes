# Linux

## Packages

- mysql-server | For hosting MySQL databases
- openssh-server | For making machine remotely accessible via ssh
    - openssh-sftp-server | For SFTP service
    - ssh-import-id | For import services

## Get Help

``man <command>`` | Open manual for any command
- Ex: ``man cd`` | view manual for the ``cd`` comman
- Ex: ``man --path`` | Shows paths where ``man`` is looking for manual pages
- ``-w`` | Shows where man page is being pulled from
- Ex: ``man -w ls`` | Show location of manual page for ``ls`` command
- Resource: [Create custom man pages](https://github.com/pjungwir/manpj/) from manpj (GitHub repo)
- Default manuals found in ``/usr/share/man`` on Ubuntu


## Config

``cat /etc/os-release`` | Check Linux version

``lsb_release -a`` | Alternative way to check Linux version

``update-alternatives`` | manages symlinks to determine defaults for commands and affects all users
- ``--config`` | Show alternatives for a configuration link group and interactively select one
- Ex: ``update-alternatives --config editor`` | Change the default text editor for that Linux system
- Resource: [How to Edit sudoers File](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file)

``df`` | stands for disk free and outputs disk space utilization info
- ``-h`` | makes output human readable, showing disk space in byte units
- Resource: [df Command Examples](https://www.geeksforgeeks.org/df-command-linux-examples/) from Geeks for Geeks


## User Commands

``whoami`` | check current user

``id <username>`` | get user ID (UID) and user's group ID's (GID)
- Ex: ``id jwhitney`` | Get jwhitney's UID and list of groups with their GID's
- Resource: [id Command](https://www.geeksforgeeks.org/id-command-in-linux-with-examples/) from Geeks for Geeks

``getent <data-file> <key>`` | gets entries from files containing user data, like *passwd* and *group*
- Ex: ``getent group`` | Lists all groups and their members from group file
- Ex: ``getent group www-data`` | Shows www-data group and all its members found in group file
- Ex: ``getent passwd`` | Lists all users, their UID, GID, home directory, login shell, and other details
- Ex: ``getent passwd jwhitney`` | Shows jwhitney user and all their details 
- Resource: [Getent Command in Linux](https://www.geeksforgeeks.org/getent-command-in-linux-with-examples/) from Geeks for Geeks
- Resource: [/etc/passwd File](https://www.ibm.com/docs/en/aix/7.1?topic=passwords-using-etcpasswd-file) from IBM

``useradd`` | create a new user
- ``-s`` | Sets the default shell for this user
- ``-m`` | Creates a directory in /home/ for this user
- ``-c`` | Sets the full name of the user. Is optional
- ``-G`` | Adds user to additional groups. Is optional
- Ex: ``sudo useradd -s /bin/bash -m -c "<Fname> <Lname>" -G <group-name> <username>`` | Creates a new user

``usermod`` | modify existing user
- ``-a`` | Add user to an additional group. Use only with -G
- ``-G`` | List groups to add user to
- Ex: ``usermod -a -G <group-name> <username>`` | Adds existing user to existing group

``passwd`` | set the user's password
- ``-e`` | Immediately expire a user's password
- Ex: ``passwd`` | Change the current user's password
- Ex: ``passwd jwhitney`` | Change jwhitney's password
- Ex: ``passwd -e jwhitney`` | Immediately expire jwhitney's password
- Ex: ``passwd --status <username>`` | Check if user has password set
  - Output: **NP** means no password set
  - Output: **P** means password is set
- You may need to turn on the setuid or setgid for /etc/passwd to use ``passwd`` command. 
    - ``sudo chmod u+s /etc/passwd`` | /etc/passwd, an executable file, will run with privileges of the owner rather than the user executing it.
- Resource: [How to Change a User's Password](https://www.geeksforgeeks.org/passwd-command-in-linux-with-examples/) from Geeks for Geeks

``chage`` | view the user's password expiration status
- ``-h`` | View list of options/flags to use with chage
- ``-l`` | Show account aging information like password expiration
- Ex: ``chage -h`` | View options/flags to use with chage
- Ex: ``chage -l jwhitney`` | Output jwhitney's account aging info 
- Resource: [chage Command in Linux](https://www.geeksforgeeks.org/chage-command-in-linux-with-examples/)

``groups <username>`` | see what groups a user is a member of
- Ex: ``groups jwhitney`` | Output groups jwhitney is a member of

``deluser <username> <group>`` | delete user from a group
- Ex: ``deluser jwhitney www-data`` | Delete jwhitney user from www-data group
- Resource: [How to Remove Users from Groups in Linux](https://www.geeksforgeeks.org/how-to-remove-users-from-groups-in-linux/) from Geeks for Geeks

``history`` | Check current user's history of commands
- Ex: ``history | grep chmod`` | Search for ``chmod`` command in user's history
- Alt: ``sudo less /home/<username>/.bash_history`` | View another user's command history
- Alt: ``sudo cat /home/<username>/.bash_history | grep <string>`` | Search specific command in another user's history

### Resources

[How to Create User Account](../processes/linux-create-user.md)


## Manage Permissions

``sudo`` | Execute a command as root or other user
- Ex: ``sudo chown -R www-data:www-data .`` | Change ownership of a directory owned by another user
- Ex: ``sudo vim /etc/apache2/sites-available/000-default.conf`` | Open and edit a file owned by root or another user
- Ex: ``sudo visudo`` | Open and edit sudoer file, which is owned by root 
- The sudoer file configures the sudo command and determines which users have sudo access
    - For example, it allows members of the sudo group to execute any command
    - You can also give specific users set sudo access to one file or a set of files
- Resource: [How to Edit the sudoers File](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file) from Digital Ocean

``chown`` | Change user ownership of files or directories
- ``-R`` | Change ownership recursively for a directory
- Ex: ``chown jwhitney file.txt`` | Change user ownership of file.txt to jwhitney user
- Ex: ``chown -R www-data directory01`` | Change user ownership of directory01 and all its contained files and directories to www-data user
- Ex: ``chown www-data:www-data file.txt`` | Change user and group ownership of file.txt to www-data

``chgrp`` | Change group ownership of files or directories
- ``-R`` | Change ownership recursively for a directory
- Ex: ``chgrp www-data file.txt`` | Change group ownership of file.txt to www-data
- Ex: ``chgrp -R jwhitney directory01`` | Change group ownership of directory01 and all its contained files and directories to jwhitney group
- Resource: [chgrp Command in Linux](https://www.geeksforgeeks.org/chgrp-command-in-linux-with-examples/) from Geeks for Geeks

``chmod`` | Modify file permissions for file/directory owner, group, and others
- ``-R`` | Change ownership recursively for a directory
- Ex: ``chmod -R g+w ocls_wp`` | Give owner group write permissions on ocls_wp directory and all contained files and directories
- Ex: ``chmod -R g+s /etc/passwd`` | Turn on setgid bit for /etc/passwd executable file
- Ex: ``chmod -R u-s /etc/passwd`` | Turn off setuid bit for /etc/passwd executable file
- Ex: ``chmod 775 .git`` | Change octal permissions of .git directory, affecting owner, group, and others
- Ex: ``sudo chmod -R u-w $(find /path/to/target/directory -type f)`` | Recursively modify permissions for **files** only within target directory
- Ex: ``sudo chmod -R u-w $(find /path/to/target/directory -type d)`` | Recursively modify permissions for **directories** only within target directory 
- User target options
    - ``u`` | set permissions for user owner of file/directory
    - ``g`` | Set permissions for group owner of file/directory
    - ``o`` | Set permissions for others
    - ``a`` | Set permissions for all
- Permission operators
    - ``+`` | Add permissions
    - ``-`` | Remove permissions
    - ``=`` | Set specific permissions, will remove and add
- Permission options
    - ``r`` | Permission to read file/directory
    - ``w`` | Permission to write to file/directory
    - ``x`` | Permission to execute file/directory
    - ``s`` | Sets the SetUID or SetGID bits
- Octal digits
    - ``0`` | no permissions
    - ``1`` | execute only
    - ``2`` | write only
    - ``3`` | ``1`` and ``2``, execute and write
    - ``4`` | read only
    - ``5`` | ``1`` and ``4``, execute and read
    - ``6`` | ``2`` and ``4``, write and read
    - ``7`` | ``1``, ``2``, and ``4``, execute, write, and read
- SetUID: set a command or executable script to run as the owner. Can be very useful and exceptionally dangerous. Use with extreme care.
- SetGID: set a directory's SetGID bit so that files created in that directory are automatically owned by the group that owns the parent directory
    - For example, if a directory called **ocls_wp** is owned by *www-data* and you run, ``sudo chmod g+s ocls_wp``, now all files and directories in **ocls_wp** will also be owned by *www-data*.
- Resource: [How to Use chmod](https://www.howtogeek.com/437958/how-to-use-the-chmod-command-on-linux/) from How to Geek
- Resource: [Linux Permissions and Octal Representation](https://www.redhat.com/sysadmin/linux-file-permissions-explained) from RedHat
- Resource: [SetUID and SetGID and Sticky Bits in Linux](https://www.geeksforgeeks.org/setuid-setgid-and-sticky-bits-in-linux-file-permissions/) from Geeks for Geeks
- Resource: [Linux Permissions Demystified](https://blog.superuser.com/2011/04/22/linux-permissions-demystified/) from Super User

``stat <file-name>`` | View status of a file or directory
- ``-c`` | Use a specified format for the status
    - ``"%a"`` | Octal format for permissions status
- Ex: ``stat -c "%a" .git`` | View octal permissions for .git directory

``umask`` | View or set umask. Umask is user file-creation mode mask. It determines file permissions for newly created files
- Ex: ``umask`` | Output current umask for user
- Ex: ``umask 022`` | Set umask to a new octal value, 022 
- Default umask is 002
- 002 vs 022
    - 002
        - A new directory's permissions: 775 (rwxrwxr-x)
        - A new file's permissions: 664 (rw-rw-r--)
    - 022
        - A new directory's permissions: 755 (rwxr-xr-x)
        - A new file's permissions: 644 (rw-r--r--)
- Resource: [Understanding Linux umask](https://www.cyberciti.biz/tips/understanding-linux-unix-umask-value-usage.html) from Cyber Citi
- Resource: [Linux Permissions Demystified](https://blog.superuser.com/2011/04/22/linux-permissions-demystified/) from Super User


## Navigation

User home directory | ``/home/<username>`` or ``~``

``cd <path-to-directory>`` | Change directory to view and interact with directories and files there
- Ex: ``cd /var/www/ocls_wp`` | change directory to ocls_wp using absolute path from /var/www
- Ex: ``cd ../www/ocls_wp`` | change directory to ocls_wp using relative path from ../www

``ls`` | list contents of a directory
- ``-l`` | Include file permissions and details in list
- ``-h`` | Output files in human readable format
- Ex: ``ll`` | Ubuntu alias for ``ls -l``, lists contents of current directory
- Ex: ``ll /var/www/ocls_wp`` | List contents of /var/www/ocls_wp directory
- Breakdown of long list format when using ``-l`` flag:
    - Example 1: ``drwxrwxr-x 8 www-data www-data 4096 Mar 27 21:32 directory01``
    - Example 2: ``-rw-rw-r-- 1 www-data www-data   13 Mar  4 19:11 file.txt``
    - Column 1, ``drwxrwxr-x``, shows the file type and permissions
        - The first letter indicates ``d`` for directory or ``-`` for file
        - The following letters are grouped into threes, typically ``rwx``, and represent permissions for different users
            - The first set of ``rwx`` is for the owner of the file
            - The second set is for the group of the file
            - The third set is for all other users
            - ``r`` gives permission to read file/directory
            - ``w`` gives permission to write to file/directory
            - ``x`` gives permission to execute file/directory
            - If there is an ``s`` in place of the ``x`` it gives permission to run executable file with privileges of the user/group owner of the file
    - Column 3, ``www-data``, is the owner of the file/directory
    - Column 4, also ``www-data``, is the group of the file/directory
    - Column 6 and 7, ``Mar 27``, are the date the file/directory was created
    - Column 8, ``21:32``, is the time the file/directory was created
    - Column 9, ``directory01``, is the name of the file/directory


## Search

``grep`` | Search for strings in file names within directories and in file contents | 
- ``-n`` | Display matched lines and line numbers 
- ``-r`` | Search current directory recursively (search all sub-directories too)
- ``-i`` | Ignore case sensitivity in search
- ``-l`` | Print only the name of files with matches
- ``--text`` or ``-a`` | search binary file as text | 
- Ex: ``grep "hello" /var/www`` | Search for "hello" in files in /var/www directory
- Ex: ``grep -i "good morning" /var/www/index.php`` | Search for "good morning", case insensitive, in index.php file
- Ex: ``ll | grep hiya`` | List files in current directory whose names contain "hiya"

``find`` | Search files or directories by name | 
- ``-name`` | Criteria to search for name of file or directory | 
- Ex: ``find /var/www/ocls_wp -name "index"`` | Search in ocls_wp directory for file or directory with name containing "index"

``wc`` | Count lines, characters, words, or bytes in a file | 
- ``-l`` | Count lines | 
- Ex: ``wc -l file.txt`` | Output number of lines written in file.txt


## Read Files

``cat <path-to-file>`` | output file contents on the command line

``less <path-to-file>`` | peruse file by page for quick viewing

``tail <path-to-file>`` | output the end of a file
- ``-f`` | Actively output tail of file as it updates. Common for monitoring log files
- ``-10`` | Print last ten lines of tail of file. 10 is default when no flag is used
- Ex: ``tail -f /var/log/apache2/error.log`` | Actively output the tail of the apache error log
- Ex: ``tail -20 /var/log/apache2/access.log`` | Output the last 20 lines of the apache access log
- Ex: ``tail -f 20 /var/log/apache2/error.log`` | Actively output the tail of a file 20 lines at a time

``diff <path-to-file1> <path-to-file2>`` | compare the differences between two files
- ``-a or --text`` | Compare binary files as text
- Ex: ``diff -a drupal-backup1.sql drupal-backup2.sql`` | Compare two sql files using the `-a` flag
- Is there software that improves on this as diff is very limited and difficult to read? See Nick's recommendation in dev meeting 2.16.24 (software is called delta)


## Create and Edit Files/Directories

``touch <path-to-file>`` | Create a blank file

``cp`` | copy a file
- Ex: ``cp file.txt file02.txt`` | Copy file.txt as file02.txt
- Ex: ``cp /var/www/html/site/file.txt /var/www/html/mnt/file.txt`` | Copy file from one location to another location

``mv`` | move or rename a file
- Ex: ``mv file.txt file02.txt`` | Rename file.txt to file02.txt
- Ex: ``mv file.txt /var/www/html/site/`` | Move file.txt to new location
- Ex: ``mv file.txt /var/www/html/site/file.txt`` | Another way to move file.txt to a new location
- Ex: ``mv file.txt /var/www/html/site/file02.txt`` | Rename and move file.txt to a new location


## Symlinking

``ln -s <path-to-target> <path-to-link-location>`` | Create a symbolic (soft) link of a file or directory in another location
- ``-s`` | Link is symbolic instead of heard. Always use symbolic links
- ``unlink <path-to-symlink>`` | Unlink/remove a symlinked file
- ``rm <path-to-symlink>`` | Remove a symlinked file or directory
- Resource: [Symlinks Tutorial](https://www.freecodecamp.org/news/symlink-tutorial-in-linux-how-to-create-and-remove-a-symbolic-link/) from freeCodeCamp


## Transfer Files Between Servers

``scp <username>@<ip-address>:<path-to-file> <local-download-location>`` | Download a file from a remote server to your local directory

``scp <local-file-name> <username>@<ip-address>:<path-to-file>`` | Upload a file from local directory to the remote server destination

``sftp <username>@<ip-address>`` | Access SFTP to transfer files between servers
- You might need to first comment out SSH agent in ~/.bashrc
- Resource: [How to Transfer Files via SFTP](ttps://www.digitalocean.com/community/tutorials/how-to-use-sftp-to-securely-transfer-files-with-a-remote-server) from DigitalOcean

``get <path-to-file>`` | In SFTP, download a file from the remote server to your local directory

``put <path-to-file>`` | In SFTP, upload a local file to the remote server


## Manage Compressed Files

``gzip <file-name>`` | Zip file(s)
- Ex: ``gzip file.txt`` | Compress file.txt into a zipped file with extension .gz
- Ex: ``gzip file1.txt file2.txt file3.txt`` | Compress multiple files into a zipped file

``gunzip <file-name>.gz`` | Unzip a compressed file
- Resource: [gunzip Command in Linux](https://www.geeksforgeeks.org/gunzip-command-in-linux-with-examples/) from Geeks for Geeks

``tar`` | Compress large directories and manage compressed tar files
- ``-z`` | Instructs tar to compress or uncompress
- ``-c`` | Create a new archive file
- ``-v`` | Request verbose operation
- ``-f`` | Sets the name of the archive file
- ``-t`` | List the contents of an archive
- ``-x`` | Extract files from an archive
- ``--exclude=<file-name>`` | Exclude specific files or directories from the command
- Ex: ``tar -zcvf uploads.tar.gz /var/www/mnt/uploads`` | Compress a large directory, like uploads
- Ex: ``tar -tf uploads.tar.gz`` | View file contents of compressed uploads directory
- Ex: ``tar -xf uploads.tar.gz`` | Extract archived directory
- Verbose means the output will provide more detailed info about the execution process when running a command. Helpful for debugging and configuration details

``zcat <path-to-file>`` | Output contents of zipped file on the command line

``zless <path-to-file>`` | Peruse zipped file by page for quick viewing

``zgrep <path-to-file>`` | Search for strings in zipped files or directories

``zdiff <path-to-file>`` | See differences between zipped files


## Timezone

``timedateclt`` | Check server's set timezone

``sudo timedatectl set-timezone America/New_York`` | Set timezone


## Updating Ubuntu OS

Notes from Will updating OP clone from LTS 18.04 to 22.04:
> Notes for the OP Update Test
> 
> - Cloned VM
> - Verified network settings
> - Updated all packages
> - Rebooted
> - Took snapshot
> - set “COMPRESS=lzma” in /etc/initramfs-tools/initramfs.conf
> - rebuild kernel with “sudo update-initramfs -u -k all”
> - remove old kernels with “sudo apt autoremove”
> - run the update with “sudo do-release-upgrade”
> - I opted to keep the currently installed version of initramfs.conf when prompted, and the same for smb.conf
> - After a reboot it is running 20.04.6 LTS.. May need to do another upgrade cycle or 2 to get to 24.04 LTS??
> - Took a snapshot and ran “sudo apt update -y && sudo apt upgrade -y”
> - run “sudo update-initramfs -u -know all” followed by “sudo apt autoremove -y”
> - run “sudo do-release-upgrade”
> 
> Note: Seems like each upgrade cycle just needs to be the following, after setting the kernel compression algorithm to lzma:
> 
> Sudo apt update -y
> Sudo apt upgrade -y
> Sudo apt autoremove -y
> Sudo update-initramfs -u -k all
> Sudo apt autoremove -y
> Sudo do-release-upgrade
> 
> They can maybe be spliced together (eg “sudo apt update -y && sudo apt upgrade -y”) and a “sudo reboot now” may need to be run in the middle of some depending on errors.
> 
> - update completed, mysql seems to be crashing now.
> - Was able to restore mysql functionality by running “sudo apt-get purge mysql-server mysql-client mysql-common”, then answering NO to deleting all mysql databases, then running “sudo apt-get install mysql-server”
> - Taking a snapshot to prepare for another update cycle
> - After “sudo do-release-upgrade” received an error that “there is no development version of an LTS available”.
> - After discussing with Jacob, this is fine as we want to stop at Ubuntu 22.04 anyway as Ubuntu 24.04 will require updating to PHP 8.3 which will break the OP.