alias ls='ls --color=auto'

export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:$NPM_PACKAGES/bin:$HOME/.local/bin


# python
alias py=python

# virtual env
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh
source /usr/share/git/completion/git-completion.bash

# dotfiles
alias config='/usr/bin/git --git-dir $HOME/.dotfiles --work-tree=$HOME'
config config status.showUntrackedFiles no

# powerline 
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh


# neovim
alias nv=nvim

# vim
export VIM_SESSION=~/.vim/sessions


#anaconda

alias conda-activate='source /opt/anaconda/bin/activate'


#emacs
alias enw='emacs -nw'

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
