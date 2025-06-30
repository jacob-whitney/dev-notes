#! /usr/bin/bash

echo "Setting up Java Development Kit (JDK)."

echo "First, updating list of apt packages to make sure "
echo "this system has the latest info on available packages. Continue?"
# take user input for yes or no

sudo apt update &&

echo "Checking if Java is already installed"

java --version

# if not installed
echo "Installing Java Runtime Environment (JRE), part of the open JDK."
echo "Which version do you want to install?"
# take user input for JDK version number

sudo apt install openjdk-<ver>-jre-headless &&

# if downloading specific version doesn't work
sudo apt install default-jre &&

echo "Confirming Java version installed"

java --version

echo "Checking that JDK is installed for compiling and running Java-based software."

javac -version

# if not installed
echo "Installing JDK."

sudo apt install default-jdk

echo "Confirming JDK version installed

javac -version

echo "Additional resources:"
echo " - https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-22-04"