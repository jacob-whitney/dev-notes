#! /usr/bin/bash

echo "Setting up SSH server and client."

echo "First, updating list of apt packages to make sure "
echo "this system has the latest info on available packages. Continue?"
# take user input for yes or no

sudo apt update &&

echo "Installing OpenSSH-Server. Continue?"
# take user input for yes or no

sudo apt install openssh-server &&

echo "Confirming ssh service is running"

sudo systemctl status ssh