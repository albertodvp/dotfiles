set -gx PATH $PATH $HOME/bin $HOME/.cargo/bin $NPM_PACKAGES/bin $HOME/.local/bin

set -gx XDG_DATA_HOME $HOME/data

set -gx  WORKON_HOME $XDG_DATA_HOME/virtualenvs

# ALIASES
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias enw='emacs -nw'

