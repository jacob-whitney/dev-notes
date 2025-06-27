# How to Alias Git Commands

## Using ``git config``

1. When inside the git repository, run ``git config --global alias`` to set an alias for any git command.
2. Examples:
   -  ``git config --global alias.co checkout`` | Use ``git co`` as an alias for ``git checkout``

- See [Git Alias](https://www.atlassian.com/git/tutorials/git-alias) from Atlassian

## Using .gitconfig File

1. To create aliases globally for your user, open the **.gitconfig** file in your home directory, ``vim ~/.gitconfig``
2. Add the following to create aliases
```
[alias]
    co = checkout
    br = branch
    ci = commit
    st = status
```

## Creating New Commands
1. Use ``git config`` to create a new command from a string.
2. Examples:
   - ``git config --global alias.unstage 'reset HEAD --'`` | Use ``unstage`` as an alias for ``reset HEAD --`` so now the following commands are equivalent
     - ``git unstage fileA``
     - ``git reset HEAD -- fileA``