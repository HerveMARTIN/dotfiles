if test -d /usr/local/bin
  set -g -x PATH /usr/local/bin $PATH
end

if test -d $HOME/.local/bin
  set -g -x PATH $HOME/.local/bin $PATH
end

if test -d /usr/local/opt/ruby/bin
  set -g -x PATH /usr/local/opt/ruby/bin $PATH
end

set -g -x PATH $PATH (ruby -e 'print Gem.user_dir')/bin

set -g -x fish_greeting ''

# enable vi mode
set -g fish_key_bindings fish_vi_key_bindings

set -g theme_nerd_fonts yes
set -g FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -g FZF_FIND_FILE_COMMAND "rg --files --hidden --follow --glob '!.git/*'"
set -g -x EDITOR "vim"
set -g -x BROWSER "google-chrome-stable"
if test "$TERM" = "xterm-termite"
  set -g -x TERM "xterm-256color"
end

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

# sudo bangbang
function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
end

if type -q neofetch
  function fish_greeting
    neofetch
  end
end
