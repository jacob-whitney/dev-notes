# Manage Git Hooks

## How to Create a Git Hook
1. In any git repository, change directory to **.git/hooks**
2. All files in .git/hooks have the .**sample** extension added. Remove this extension for a hook to work
   1. For example, ``mv pre-commit.sample pre-commit``
3. Make sure to understand how each hook works before activating it
   - **pre-commit:** applies on ``git commit`` before commit is submitted
   - **pre-push:** applies on ``git push`` before push is submitted
4. Git hooks work like any other script, running the commands in that file when that hook is activated with the right git command
5. If you create a new file in .git/hooks, make sure to make it executable, ``sudo chmod +x <git-hook>``

**Resources:**
- [Git Hooks](https://www.atlassian.com/git/tutorials/git-hooks) from Atlassian
- [Bash and Shell Scripting](../subjects/bash-shell-scripts.md)