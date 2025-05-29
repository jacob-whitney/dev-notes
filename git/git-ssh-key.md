# How to Setup SSH Keys on a Server

## Generate and Add Keys

- Resource: [Generating a New SSH Key for GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Resource: [Set Up SSH Keys in Linux for Atlassian](https://support.atlassian.com/bitbucket-cloud/docs/set-up-personal-ssh-keys-on-linux/)
1. On the server, or local machine, generate a new SSH Key, ``ssh-keygen -t ed25519 -C "<email-address>"``
2. Complete the prompts for generating the new key
    1. **Enter file in which to save the key:** ``/home/<user>/.ssh/id_<key-name>``
        1. key-name should describe the account or service the key is for (e.g. id_jw_github)
    2. **Enter passphrase:** leave blank
    3. **Enter same passphrase again:** leave blank
3. To ensure the correct SSH key is used when connecting to BitBucket, update ``~/.ssh/config`` file:
4. ```
   Host bitbucket.org
     AddKeysToAgent yes
     IdentityFile ~/.ssh/<ssh-private-key>
   ```
    1. **id-key.pub** is the public key
    2. **id-key** is the private key
5. Start the ssh-agent, ``eval $(ssh-agent)``
6. Add the key to the agent, ``ssh-add /path/to/<key-name>``
    1. NOTE: Use the private key (e.g. id_ed25519) and not the public key (e.g id_ed25519.pub)
7. Or just add these two lines to ``~/.bashrc`` and refresh bash to execute both commands
    1. Enter the following lines at the top of your ~/.bashrc file
    2. ```
       # Start SSH agent and add <git-service> SSH key
       eval $(ssh-agent)
       ssh-add /home/<user>/.ssh/<key-name>
       ```

    3. Refresh bash, ``exec bash``
8. Add the to your remote service account
    1. BitBucket
        1. Click on the **profile icon** at the top-right
        2. Select **Personal settings**
        3. In *Personal Settings'* left-hand menu, select **SSH keys**
        4. Click **Add key** button
        5. Name the key after the server or local machine
        6. On the server, open the private key file, ``vim /path/to/<key-name>.pub``
        7. Copy the contents of the private key file
        8. Paste the key in BitBucket
        9. Click **Add key**
    2. GitHub
        1. Click on the **profile icon** at the top-right
        2. Select **Settings**
        3. In *Settings'* left-hand menu, under *Access*, select **SSH and GPG Keys**
        4. Under *SSH Keys*, click the **New SSH Key** button
        5. Name the key after the server or local machine
        6. On the server, open the private key file, ``vim /path/to/<key-name>.pub``
        7. Copy the contents of the private key file
        8. Paste the key in GitHub
        9. Click **Add SSH key**
9. Verify configuration on the server, ``ssh -T git@<service-url>``
    1. BitBucket service URL: ``bitbucket.org``
    2. GitHub service URL: ``github.com``

## Change Passphrase

1. ``ssh-keygen -p -f ~/.ssh/<private-key>`` | Change passphrase of existing SSH key
2. Generate a passphrase online
3. Save new passphrase in Keeper