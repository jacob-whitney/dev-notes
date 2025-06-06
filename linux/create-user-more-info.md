# Create a User Account in Linux (Ubuntu)

> Initial account should be your user for daily access and IDE access

1. Login with administrator account
    1. To connect as administrator with Azure, see [Azure](../subjects/azure.md) > Connect to VM
2. Check if user exists, ``getent passwd <username>`` or ``id <username>``
    1. Resource: [Check if a User Exists](https://www.baeldung.com/linux/user-exists-check) by Baeldung
3. If they don't exist, create new user, ``sudo useradd -s /bin/bash -m -c "<Fname> <Lname>" -Gwww-data <username>``
    - Resource: [Create Linux User](https://www.howtogeek.com/806104/create-linux-user/) by How to Geek
4. Check what groups the user is in.
    - View what groups a user is in, ``groups <username>``
    - View what users are in a group, ``getent group <group-name>``
    - View a user's uid, gid, and groups, ``id <username>``
    - Resource: [Check User Group Privileges](https://www.baeldung.com/linux/check-user-group-privileges) by Baeldung
5. If the user is a developer and not part of the following groups, add them, ``usermod -a -G <group-name> <username>``
    1. www-data
    2. sudo
    3. Resource: [Add a User to a Group](https://www.howtogeek.com/50787/add-a-user-to-a-group-or-second-group-on-linux/) by How to Geek
6. Set the user's password, ``passwd <username>``
7. Expire the current password so the user has to create a new one, ``passwd -e <username>``
    1. View the user's password expiration status, ``chage -l <username>``
    2. Resource: [How to Change Linux Passwords](https://www.cyberciti.biz/faq/linux-set-change-password-how-to/) by nixCraft
    3. Resource: [Force User to Change Password](https://www.tecmint.com/force-user-to-change-password-next-login-in-linux/) by TecMint