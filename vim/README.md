# Vim

## CLI Commands

``vim /path/to/file/<file-name>`` | Open file in Vim


## Vim Modes

``i`` | Enter insert mode for editing text

``v`` | Enter visual mode for selecting text

``Shift + V`` | Enter visual line mode, for selecting whole lines of text at a time

``:`` | Enter command mode

``Esc`` | Exit to normal mode


## Command Mode Commands

``:q!`` | Exit without saving

``:w!`` | Save only

``:x!`` | Save and exit
- ``:wq!`` | Alternative save and exit

``:set number`` | Show number lines

``:set nonumber`` | Hide number lines

``:/<keyword>`` | Search for a keyword
- Ex: ``:/hello`` | Search for "hello" in file

``:n`` | Move to the next matching word

``:N`` | Move to the previous matching word


## Normal Mode Commands

``k`` | Navigate insertion point up

``j`` | Navigate insertion point down

``h`` | Navigate instertion point left

``l`` | Navigate insertion point right

``G`` | Navigate insertion point to end of file

``gg`` | Navigate insertion point to beginning of file

``x`` | Delete character selected by insertion point

``i`` | Insert before current position

``a`` | Insert after current position

``o`` | Insert on new line below current position

``u`` | Undo

``Ctrl + r`` | Redo


## Visual Mode Commands

NOTE: Normal mode commands work the same in visual mode

``d`` | Delete selected text

``p`` | Paste deleted text

``Shift + >`` | Indent selected text

### Resources
- [Getting Started with Vim Visual Mode](https://opensource.com/article/19/2/getting-started-vim-visual-mode) from OpenSource