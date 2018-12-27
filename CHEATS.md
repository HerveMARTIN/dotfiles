# Fish
| Key Binding | Description |
| --- | --- |
| `Alt-Left/Right` | go to prev/next word in the command line, or popd/pushd if command line is empty |
| `Alt-Up` | get last part of previous command (eq. to $! in bash) |

## fzf
| Key Binding | Description |
| --- | --- |
| `C-r` | search in history |
| `C-t` | search in files |
# Vim
![cheats](http://www.nathael.org/Data/vi-vim-cheat-sheet.svg)

| Key Binding | Description |
| --- | --- |
| Normal | --- |
| `zz`/`zt`/`zb` | set current line at top/middle/bottom of the screen |
| `ZZ` | save and quit |
| `ZQ` | quit without saving |
| `C-y`/`C-e` | scroll one line |
| `C-u`/`C-d` | scroll half-page |
| `C-b`/`C-f` | scroll full-page |
| `0`/`$` | go to the beginning/end of line |
| `^`/`g_` | go to the first/last char on line |
| `e`/`E` | go to the end of next "word"/"big word" (including '-') |
| `w`/`W` | go to the beginning of next "word"/"big word" (including '-') |
| `b`/`B` | go to the beginning of last "word"/"big word" (including '-') |
| `{`/`}` | go to next/previous paragraph |
| `C-u/d` | move half page up/down |
| `C-b/f` | move one page backward/foreward |
| `' '` | go back to the line where the cursor was before the last go to |
| `' .` | go to last changed where the cursor was before the last go to |
| `f x` | find the next 'x' character |
| `*` | search for current word and go to next occurence |
| `#` | search for current word and go to previous occurence |
| `gd` | go to definition (first occurence) of current word |
| `%` | go to corresponding (){}[] |
| `dfx` | delete text to the next occurence of 'x' included |
| `qx` | record macro named x |
| `@x` | call marco named x |
| `>>` | indent line |
| `<<` | unindent line |
| `C-w w` or `C-w C-w` | switch between panes |
| `C-l` | go to next buffer |
| `C-h` | go to previous buffer |
| `, b` | git blame |
| `, n` | toggle line numbers |
| `, r` | toggle relative line numbers |
| `, f` | fuzzy find files |
| `, bs` | fuzzy search buffers |
| `, e c` | edit vimrc | 
| `, s c` | source vimrc | 
| `, p i` | run PlugInstall |
| `, c Space` | toggle comment |
| `Space` | toggle NERDTree |
| `v` | go to visual mode |
| `V` | go to visual line mode |
| `C-v` | go to visual block mode |
| Visual | --- |
| `f x` | select to the next 'x' character |
| `e` | select to the end of word |
| `$` | select to the end of line |
| `i "` | select everything between the double quote |
| `o` | go to the opposite corner of the block selection |

## NERDTree
| Key Binding | Description |
| --- | --- |
| `R` | reload directory |
| `i` | open in split view |
| `s` | open in vsplit view |
| `C` | set selected folder as root in tree view |
| `m` | enable modifications on the tree |
| `m a` | add a new file under the selected folder |
| `m d` | delete the selected file/folder |
| `m m` | move the selected file elsewhere |

## Tmuxline
| Command | Description |
| --- | --- |
| `:Tmuxline airline` | use airline theme in tmux |

# Tmux
| Key Binding | Description |
| --- | --- |
| `C-a C-a` | switch from last 2 windows |
| `C-a p` | previous window |
| `C-a n` | next window |
| `C-a l` | last used window |
| `C-a (` | previous session |
| `C-a )` | next session |
| `C-a L` | last used session |
| `C-a s` | choose a session from a list |
| `C-a $` | rename current session |
| `C-a %` | split vertically |
| `C-a "` | split horizontally |
| `C-a arrows` | move to pane according to arrow direction |
