# WP-CLI

## Config

``wp cli version`` | Check the WP-CLI version


## General

``wp help`` | Manual for WP commands
- Get help with a specific command with ``wp help <command>``

``wp core`` | View and update core version 

``wp theme`` | Manage themes

``wp plugin`` | Manage plugins

``wp option`` | Get and set site plugin and WordPress settings

``wp cache`` | Manage cache

``wp transient`` | Manage entries in the WordPress Transient Cache

``wp rewrite`` | Manage rewrite rules

``wp embed fetch`` | Rewrite a URL


## Core

``wp core version`` | Check current WordPress version

``wp core download`` | Download the latest version of WordPress core's files
- ``--version=<version>`` | Download a specific version of core
- Ex: ``wp core download --version=6.6.1``

``wp core install`` | Creates teh WordPress tables in the database using the details provided
- If you install WordPress in a subdirectory, update the siteurl with ``wp option update siteurl``
- Ex: ``wp core install --url=dev-jacob.ocls.info --title=OCLS --admin_user=jacob_adm --admin_password=password --admin_email=jwhitney@ocls.info``
- ``--url=<url>`` | Set the domain of the new site
- ``--title=<title>`` | Set the title of the new site
- ``--admin_user=<username>`` | Set the username of the admin user
- ``--admin_password=<password>`` | Set the password of the admin user
- ``--admin_email=<email>`` | Set the email of the admin user


## Posts

``wp post-type`` | View and manage post types

``wp post-type list`` | List all post types

``wp post-type get <post-type-name>`` | Get details for a specific post type

``wp post`` | Manage posts, content, data

``wp comment`` | Interact with comments

``wp taxonomy`` | Manage taxonomies

``wp term`` | Interact with specific taxonomy details

``wp media`` | Interact with media


## Users

``wp user`` | Edit, update, create users

``wp user list`` | List users

``wp user get <user_login>`` | List a user's details, including current roles

``wp user create <username> <email>`` | Create a WordPress user
- ``--user_pass=<password>`` | Create user with a password
- Ex: ``wp user create jwhitney jwhitney@ocls.info --user_pass=1234``

``wp user delete <user-id>`` | Delete a user by their ID
- ``--reassign=<user-id>`` | Reassign posts to another user by ID
- Ex: ``wp user delete 123 --reassign=456`` | Delete a user and reassign their posts to another user

``wp user set-role '<user-login>' '<role-key>'`` | Set single role for a user
- Ex: ``wp user set-role 'jwhitney' 'author'``
- Ex: ``wp user set-role 114 'author'``

``wp user add-role '<user_login>' '<role-key>'`` | Add additional roles to user

``wp user remove-role '<user_login>' '<role-key>'`` | Remove roles from user


## Roles

``wp role`` | Manage roles

``wp role list`` | List roles

``wp role create '<role-key>' '<role-name>'`` | Create a role
- Ex: ``wp role create marketing Marketing``


## Capabilities

``wp cap`` | Manage capabilities

``wp cap list '<role-key>'`` | List capabilities of a role
- Ex: ``wp cap list 'marketing'``

``wp cap add '<role-key>' '<capability>'`` | Add capabilities to a role
- Ex: ``wp cap add 'marketing' 'read'``

``wp cap list '<original-role-key>' | xargs wp cap add '<new-role-key>'`` | Add capabilities of one role to another
- Ex: ``wp cap list 'author' | xargs wp cap add 'developer'`` | copy caps from 'author' role to existing 'developer' role

### Resources

[Update and Import Roles and Capabilities](https://www.nexcess.net/help/update-user-role-wordpress/) from Nexcess  
[xargs command in Unix](https://www.geeksforgeeks.org/xargs-command-unix/) from Geeks for Geeks


## Databases

``wp db prefix`` | View WordPress database prefix

``wp db size`` | View size of WordPress database

``wp db tables`` | View database tables
- ``--all-tables`` | View all/hidden tables
- Ex: ``wp db tables --all-tables``

``wp db columns <table-name>`` | View columns in a table

``wp db cli`` | Access MySQL command line interface

``wp db optimize`` | Reorganize database for easier SQL queries

``wp migrate <subcommand>`` | Migrate the WP database with various commands
- Subcommands:
  - export
  - find-replace
  - push
  - pull
  - profiles
  - profile
  - setting
  - import
- Resource: [WP Migrate WP-CLI Commands](https://deliciousbrains.com/wp-migrate-db-pro/doc/wp-cli-command/) from Delicious Brains


## Queries

``wp db query "<SQL-query>"`` | Query the database
- WP-CLI queries don't need semicolon

``wp db search '<search-string>' --all-tables`` | Search for content in database


## Plugins

``wp plugin list`` | View all installed plugins

``wp plugin activate <plugin-slug>`` | Activate a specific plugin by name
- Ex: ``wp plugin activate wp-migrate-db-pro``

``wp plugin deactivate <plugin-slug>`` | Deactivate a specific plugin by name


## MigrateDB Plugin

``wp migratedb pull <site-to-pull-from> <secret-key>`` | Pull database from another source
- The secret key can be found in the Migrate DB plugin page of the site you are pulling from. Go to the Settings tab and find it under Connection Info