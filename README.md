# Jacob's Developer Notes

A comprehensive guide to developer tools, CLI commands, and guides.

## File Structure Guide

Each subdirectory represents different topics or environments, such as Linux, PowerShell, or VS Code.

Within each **topic directory**, there is:
- **README.md** | Explains the purpose of this directory and its topic/environment
- **action.sh** | Shell files show command steps in order to complete a specific task
  - Could later be used to run a list of commands, completing a task instantaneously
- **command.md** | Markdown files that define a specific command that can be used within this directory's environment

For example:
- linux
  - apt.md
  - cd.md
  - ls.md
  - setup-mysql.sh
  - setup-ssh.sh
- wsl
  - install.sh