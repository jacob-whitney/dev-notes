# Configure Git Settings and Style Preferences

1. [Generate and Add SSH Key](git-ssh-key.md)
2. Clone repository in desired directory, ``git clone git@<repo-source-url>:<repo-name>.git``
3. 

4. Add ssh key to /home/user/.ssh, see ssh-keys.md
    1. Add eval and ssh-add to .bashrc
5. Clone repo
6. Configure user.name, user.email, and core.editor
7. Add safe directory
8. Add styling to .bashrc to see branch
```
# Git config
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
```

9. 