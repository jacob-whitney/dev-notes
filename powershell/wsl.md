``wsl``

### Description

Powershell commmand to install and manage Windows Subsystem for Linux (WSL) distributions

### Notes

- ``-l`` | List Linux distributions
- ``-o'' | List Linux distributions available online
- Ex: ``wsl -l -o``
- ``--install`` | Install WSL
- ``-d`` | Specify a distribution
- Ex: ``wsl --install -d Ubuntu`` | Install latest Ubuntu distribution of WSL
- ``-u`` | Enter username
- Ex: ``wsl -u root`` | Login as root
- ``-v`` | Check WSL version
- Ex: ``wsl -l -v`` | List WSL version
- ``--set-version`` | Set WSL to specific version
- Ex: ``wsl --set-version Ubuntu-24.04 2``

### Resources
- [How to install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install) from Microsoft Learn
- [Basic commands for WSL](https://learn.microsoft.com/en-us/windows/wsl/basic-commands) from Microsoft Learn
