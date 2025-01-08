# Windows Subsystem for Linux (WSL)

## Install

1. Before running install.sh or its related commands, enable the necessary Windows features:
    1. In the Windows search bar, type "Windows Features"
    2. Open **Turn Windows features on or off**
    3. In *Windows Features* window, scroll down to **Windows Subsystem for Linux** and mark the checkbox to turn it on
    4. Also turn on **Virtual Machine Platform**
    4. Click **Okay**
    5. Restart your computer
2. Once computer is restarted, open Powershell
3. Install WSL using **install.sh**

## Access via Windows File Explorer

1. Open **File Explorer**
2. In the address bar, type "\\wsl$"
3. Open distribution folder (ie **Ubuntu**) to access its files

## Create Default User

1. If distribution (Ubuntu, etc.) installation process does not include creating a default user, follow linux/create-user.sh

## Create Additional Users

1. Follow linux/create-user.sh 

## Configure VS Code on New Devices

1. Set WSL as default tab on VS Code terminal
    1. Press **F1** to show Command Palette
    2. Type in "Terminal: Select Default Profile"
    3. Select **Ubuntu (WSL)** or your preferred distribution if it's different
