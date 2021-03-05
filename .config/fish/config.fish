set -gx GHCUP_INSTALL_BASE_PREFIX $HOME

set -gx XDG_DATA_HOME $HOME/data

set -gx  WORKON_HOME $XDG_DATA_HOME/virtualenvs

set -gx TERM 'xterm-256color'

set -gx _JAVA_AWT_WM_NONREPARENTING 1

# ALIASES
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias e 'emacsclient -t -nw'

# ghcup-env
# set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
# test -f /home/alberto/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/alberto/.ghcup/bin $PATH

