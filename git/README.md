# Git

## Initializing Git 

``git init`` | Initialize a new Git repo in the current directory
- Works with empty directories and those with content already added
- If content is already added, stage and commit those files to add them to the repo

``git clone git@<source-url>:<user>/<repo>.git`` | Clone an existing BitBucket repo in current directory using SSH
- Ex: ``git clone git@bitbucket.org:jwhitney1/test_init_archive.git``
- Ex: ``git clone git@github.com:jacob-whitney/docs.git``

### Resources

[Add Git SSH Keys](../processes/git-ssh-key.md) from local


## Remote Configuration

``git remote -v`` | Check remote URL

``git remote add <remote-name> <remote-url>`` | Add a new remote
- Ex: ``git remote add origin git@bitbucket.org:OCLSLibrary/intranet2.git``
- When adding brand new remote, you will need to pull in the branch with its initial commit, then you can commit local files on top

`` git remote set-url <remote-name> <remote-url>`` | Change the remote URL in a local repository
- Ex: ``git remote set-url origin git@bitbucket.org:OCLSLibrary/intranet2.git``
- Find the remote URL by clicking Clone button on the Source page of the repo.

### Resources

[Changing a remote repo's URL](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories) from GitHub Docs


## Setup and Config

Typical root directory location | ``/var/www/project_directory``
 
``git config --global --add safe.directory /path/to/repo/directory``  | Add safe directory  
 
``git config --global user.name "username"`` | Configure username

``git config --global user.email "email@example.com"`` | Configure user email

``git config --list --show-origin`` | Show git configuration

``git config --global core.editor "vim"`` | Set text editor to be used by Git to vim

``git config --unset user.name``  | Unset username
- By not indicating --global or other flag, default is --local

``git config --unset user.email`` | Unset user email

``git config --global pull.rebase false`` | Reconcile divergent branches by merge
- Performs a merge strategy, creating a new merge commit and combines changes from the branch you are merging in

``git config --global pull.rebase true`` | Reconcile divergent branches by rebase
- WARNING: not recommended or use with caution with -i (interactive) flag!
- Reapplies local commits on top of the upstream branch's new commits.

``git config --global pull.ff only`` | Reconcile divergent branches by fast-forward only

### Resources

[Git config](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config) from AtlassianGit  
[How to Configure Git](how-to/git-config.md) from local


## Get Help

``git help <command>`` | Access manual for git commands


## Reading Files

``git blame <file-name>`` | See history and author of changes to a file


## Stashing Modified Files

``git stash`` | Stash modified files

``git stash apply`` | Unstash or bring back modified files

``git stash apply stash@{n}`` | Unstash a specific stash

``git stash list`` | List history of stashed files

``git stash list --stat`` | List stashes and the modified files they are stashing



## Staging Files

``git restore path/to/file`` | Restore unstaged files to prior state

``git checkout path/to/file`` | Alternative if restore not available

``git restore --staged path/to/file`` | Unstage a staged file
- Alternative: ``git reset HEAD path/to/file``
- Resource: [git-scm/undoing-things](https://git-scm.com/book/en/v2/Git-Basics-Undoing-Things)

``git clean path/to/file`` | Remove untracked files from working tree
- ``-n`` | Don't actually remove anything, just show what would be done
- ``-f`` | Force deleting files if Git refuses to git  files
- Resource: [git-scm/git-clean](https://git-scm.com/docs/git-clean)


## Commits

``git reset --hard HEAD~1`` | Remove commit HEAD is currently pointed to

``git fetch origin master && git cherry-pick <commit-hash>`` | Pull single commit into staging/prod
- Branch name, like "master" will very. This command is specific to I2 staging and production
- Ex: ``git fetch origin master && git cherry-pick 7f9ad12``


## Changing Commits

``git revert <commit-hash>`` | Undoes changes in selected commit with a new commit that reverts everything in the previous commit
- Resource: [Git revert](https://www.atlassian.com/git/tutorials/undoing-changes/git-revert) from Atlassian

``git rebase -i HEAD~3`` | Display the last 3 commits on current branch
- Expected file contents:  
- <img src="../images/git-rebase-i.png" alt="Example output of git rebase -i command" width="500">
- To change the listed commits, replace 'pick' with 'reword'. Save and close
- Each command file will open consecutively. Edit, save, and close until you return to command line
- Check that changes to commit were saved with ``git log``
- Resource: [GitHub docs](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message)

``git rebase -i <commit-hash>`` | Option to edit all commits above the commit-hash selected

``git reset --hard HEAD^`` | Remove last commit

``git reset --hard HEAD~2`` | Remove two or more of last commits

``git reset --hard <commit-hash>`` | Move the head to a specific commit

``git reset --soft HEAD^`` | Remove a commit and move changes to staging area

``git reflog`` | View history of changes to the repository

``git reset --soft <reflog-entry-hash>`` | Undo a git reset, hard or soft

``git cherry-pick <commit-hash>`` | Copy a single commit from one branch to another
- First checkout the branch you want to copy the commit to, then ``git cherry-pick`` using the hash for the commit in the other branch
- ``--edit`` | Edit the cherry-picked commit's message

### Resources

[Deleting commits from a branch](https://www.w3docs.com/snippets/git/deleting-commits-from-a-branch-in-git.html#deleting-the-latest-commits-2) from W3docs  
[Undo git reset --soft](https://chat.openai.com/share/62cb3657-4c3e-4d08-8759-bb56bee9aff3) from ChatGPT
[Git cherry pick](https://www.atlassian.com/git/tutorials/cherry-pick) from Atlassian


## Branches

``git branch -a`` | List all local and remote branches

``git checkout <branch-name>`` | Checkout a branch

``git checkout -b <new-branch-name>`` | Create a new branch 

``git branch --delete <branch-name>`` | Delete a branch
- To delete branch from remote repo in BitBucket, use ``git push <remote-name> :<branch-name>``

``git rebase <branch>`` | Insert older commits from one branch to another
- IMPORTANT: Only works if branch you are rebasing to is in sync with other branch with same commit hashes. Otherwise, use ``git merge`` or ``git pull``

``git fetch <remote> <branch>`` | Fetch a remote branch so you can checkout locally
- Ex: ``git fetch origin alpha``
- Command typically followed by ``git checkout alpha``

``git branch -m <old-name> <new-name> `` | Rename local master branch
- Ex: ``git branch -m staging production``
- ``-m`` or ``--move`` | to move or rename a branch

``git push -u origin <new-branch>`` | Push the new branch upstream to BitBucket
- Ex: ``git push -u origin production``
- ``-u`` | to push upstream, sets the tracking relationship for the local branch

``git push origin -d <old-branch>`` | Delete the old branch in BitBucket
- Ex: ``git push origin -d staging``

### Resources

[What is Git Rebase](https://www.simplilearn.com/what-is-git-rebase-command-article#what_is_git_rebase) from Simplilearn  
[Rebasing Remote Branches](https://linuxhint.com/rebasing-remote-branches-in-git/) from linuxhint  
[Git Rebase vs Merge](https://chat.openai.com/share/c91e5cea-0553-44be-811a-22c7c97ab8b8) from ChatGPT  
[Branch Management](https://git-scm.com/book/en/v2/Git-Branching-Branch-Management) from git-scm  


## Logs

``git log`` | View log of commits
- ``--raw`` | View files changed for each commit in log
  - Ex: ``git log --raw``
- ``--patch`` | View changes to files for each commit in log
  - Ex: ``git log --patch``
- ``--author="<username>"`` | View commits from specific user
  - Ex: ``git log --author="jwhitney"``
- ``--until=yyyy-m-d`` | View commits up until a certain date
  - Ex: ``git log --until="2024-01-18``
- ``--pretty=oneline`` | Displays commits with all details on one line
  - Ex: ``git log --pretty=oneline``



## Tags

``git tag`` | List stored tags
- ``-l`` | Refined list flag for filtering tag names
  - Ex: ``git tag -l *-lw*`` | Search for tags with lightweight (lw) label
- ``-n`` | Show tag messages
- ``-n<#>`` | Show a specific number of lines of tag messages
  - Ex: ``git tag -n3`` | Show the first 3 lines of tag messages

``git tag -a <tag-name>`` | Create an annotated tag to capture a point in history to mark a version release
- ``-a`` | Annotated tag flag to store a tag as a full Git object with meta data. Always use this
  - Ex: ``git tag -a v1.4.0``
- ``-m`` | Message flag for leaving a message for the tag
  - Ex: ``git tag -a v1.7 -m "Add Linux related topics"``
- ``-d`` | Delete a tag. Does not delete commits, only tag name and meta data
  - ``git tag -d v1.3`` | Delete v1.3 tag
  - To push deletion of a tag to remote, use ``git push <remote-name> :refs/tags/<tag-name>``

``git tag <tag-name> <commit-hash>`` | Tag old commits
- Ex: ``git tag -a v1.2 15027957951b64cf874c3557a0f3547bd83b3ff6``
- ``-f`` | Force a git tag to be renamed or reassigned
- Ex: ``git tag -a -f v1.4 15027957951b64cf874c3557a0f3547bd83b3ff6`` | Assigns new git tag ``v1.4`` to a commit that was already assigned tag ``v1.2``
  - Can also be used if ``v1.4`` tag was already assigned somewhere else

``git push <remote> <tag-name>`` | Push tag to remote
- Ex: ``git push origin v1.4``

``git push <remote-name> --tags`` | Push multiple tags to remote
- You can also push tags with a branch, using ``git push <remote-name> <branch-name> --tags``

``git pull remote-name> --tags`` | Pull multiple tags from remote
- You can also pull tags with a branch, using ``git pull <remote-name> <branch-name> --tags``

``git checkout <tag-name>`` | View state of a repo at any given tag
- Enters detached HEAD state. ``git checkout <branch>`` to return to current version

### Resources

[Git Tag Tutorial](https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-tag) from Atlassian  
[Repository tags](https://support.atlassian.com/bitbucket-cloud/docs/repository-tags/) from Atlassian


## Aliasing

``git config --global alias.<alias> <git-command>`` | Set an alias for any git command
- Ex: ``git config --global alias.co checkout``

### Resources

[Git Alias](https://www.atlassian.com/git/tutorials/git-alias) from Atlassian  
[How to Git Alias](../processes/git-alias.md) from local 


## Hooks

### Resources

[How to Use Git Hooks](../processes/git-hook.md) from local