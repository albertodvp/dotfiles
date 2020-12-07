set -gx GHCUP_INSTALL_BASE_PREFIX $HOME

set -gx XDG_DATA_HOME $HOME/data

set -gx  WORKON_HOME $XDG_DATA_HOME/virtualenvs

set -gx TERM 'xterm-256color'
# ALIASES
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias e 'emacsclient -t -nw'

