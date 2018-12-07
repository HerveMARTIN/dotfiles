if test -d /usr/local/opt/ruby/bin
  set -g -x PATH /usr/local/opt/ruby/bin /usr/local/bin $PATH
end
set -g -x fish_greeting ''

set -g theme_nerd_fonts yes
set -g FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git"
set -g -x EDITOR "vim"

for repo in (/bin/ls -1 ~/Documents/workspace)
  alias $repo "tmuxinator dev $repo"
end

source ~/.config/fish/abbr.fish

if [ -f ~/.config/fish/aliases.fish ]
  source ~/.config/fish/aliases.fish
end

if [ -f ~/.config/fish/completions/pass.fish ]
  source ~/.config/fish/completions/pass.fish
end
