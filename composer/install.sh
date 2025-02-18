#! /usr/bin/bash

echo "What is your WordPress project's root directory of your project?"
# take user input for file path to root directory

echo "Creating default composer.json file in your root directory."

# cd to root directory

vim composer.json &&

cat ~/.dev-notes/composer/composer.json >> composer.json &&

echo "See https://wpackagist.org/ to search for correct entries for additional plugins and themes."

echo "Ready to install Composer. Continue?"
# get user input for yes or no

curl -sS https://getcomposer.org/installer | php &&

echo "Do you want to use composer globally or locally in one specific project?"
# get user input for globally or locally

# if locally
echo "Installing dependencies using Composer locally."

php composer.phar install &&



# if globally
echo "Setting up Composer for global use"

sudo mv composer.phar /usr/local/bin/composer &&

echo "Installing dependencies using global Composer command"

# Make sure still in project root directory and composer.json file is created and accurate

composer install &&



echo "Additional resources:"
echo " - https://wpackagist.org/"
echo " - https://packagist.org/"
echo " - https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos"