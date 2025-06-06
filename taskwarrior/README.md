# Taskwarrior

## Config

``sudo apt-get install taskwarrior -y`` | Install Taskwarrior

``task version`` | Check Taskwarrior version installed

``task show`` | Show all Taskwarrior settings variables
- Ex: ``task show | grep report | grep sort`` | Show sort order of all reports

``task config <variable> <value>`` | Change settings of commands and variables
- Ex: ``task config report.all.sort project+,start+`` | Change sort order of **all** report to project ascending followed by start ascending
- Ex: ``task config report.all.sort`` | Set variable back to default
- Sorting:
  - ``project+`` | Sort by project column in ascending order
  - ``entry-`` | Sort by entry column in descending order

### Resources
- [Examples](https://taskwarrior.org/docs/examples/) from Taskwarrior
- [Commands](https://taskwarrior.org/docs/commands/) from Taskwarrior


## Reports

``task list`` | List current tasks
- ``+DUETODAY`` | List tasks due today
- Ex: ``task +DUETODAY list``
- ``+DUE -DUETODAY`` | List tasks due, but not today
- Ex: ``task +DUE -DUETODAY list``

``task completed`` | View completed tasks

``task all`` | List all tasks, including pending, completed, and deleted
- ``project:<project-name>`` | Filter by project
- Ex: ``task all project:proj-man``

``task columns`` | Shows all columns, and their descriptions, available in reports
- Resource: [Columns command](https://taskwarrior.org/docs/commands/columns/) from Taskwarrior

## Tasks

### View Tasks

``task <filter> info`` | View details about task, including annotations

### Edit Tasks

``task add "Project description"`` | Add a task
- ``project:<project-name>`` | Specify project when adding a task
- Ex: ``task add "Learn taskwarrior" project:proj-man``
- Ex: ``task add "How to manage projects" project:"Setup Project Management"``

``task <task-id> done`` | Mark task as complete
- Ex: ``task 1 done``

``task <filter> modify <description>`` | Modify a task's description
- ``task <filter> modify -<tag> +<tag>`` | Add and subtract tags from a task
  - ``-<tag>`` | Subtract tag
  - ``+<tag>`` | Add tag
- Ex: ``task 1 3 5-10 modify -home`` | Remove the **home** tag from tags 1, 3, and 5 through 10
- Ex: ``task 1 modify priority:H`` | Set task priority as high
  - Priority options:
    - H
    - M
    - L
- Resource: [Modify Command](https://taskwarrior.org/docs/commands/modify/) from Taskwarrior

``task annotate <filter> "<annotation>"`` | Add annotation to a task
- Ex: ``task annotate 2 "Define subtasks for this task"`` | Create annotation for note ID #2

``task <filter> denotate`` | Delete oldest annotation one at a time from selected task
- Ex: ``task 2 denotate``

``task edit <task-ID`` | Edit a tag's meta data, description, and annotations



## Projects

``task summary`` | View summary of projects, including number of remaining tasks, percent complete, and completion bar

``task project:OLDNAME modify project:NEWNAME`` | Rename a project