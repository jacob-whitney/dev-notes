``mysqlsh``

### Description

Access MySQL Shell for running global object functions like ``util``

### Notes

- Ex: ``mysqlsh -u <username> -p`` | Login as user
  - ``-u`` | Username flag
  - ``-p`` | Password flag, will prompt password if nothing follows flag


### Shell Methods

- ``> util.help()`` | Get help with util global object
- ``> util.check_for_server_upgrade`` | Check for compatibility issues for upgrade to MySQL. Used in python version of shell
