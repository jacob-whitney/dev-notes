# Install Composer

``curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php`` | Retrieve the composer installer via curl

``HASH=`curl -sS https://composer.github.io/installer.sig` `` | Save the SHA-384 hash into a shell variable
- ``echo $HASH`` to view the hash value

``php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"`` | Verify the installation script is safe to run
- Output should be ``Installer verified``

``sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer`` | Install composer globally

``composer`` | Test installation succeeded  
<img src="../images/composer-succeeded.png" alt="Example output of wp_terms table" width="500">

### Resources
[How to Install Composer on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-composer-on-ubuntu-22-04)