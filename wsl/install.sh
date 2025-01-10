#! /usr/bin/bash

echo "Read the README.md Install section before running this script. Continue?"
# take user input for yes or no

echo "Preparing to install Windows Subsystem for Linux (WSL)"

echo "Setting default WSL version to 2. Continue?"
# take user input for yes or no

#wsl --set-default-version 2

echo "Is Ubuntu distribution's latest version ok?"
# take user input for yes or no

# If no
echo "Which distribution?"
wsl -l -o &&
# take user input for distribution

echo "Installing WSL, [user-input] distribution. Continue?"
wsl --install -d [user-input] &&

# If Ubuntu app hangs on "Installing, this may take a few minutes"
# Try opening WSL on VS Code
# If it's configured, exit the Ubuntu app, even if it is still hanging



