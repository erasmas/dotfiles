# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git debian last-working-dir lein zsh-syntax-highlighting vagrant)

# Activate Node Version Manager
source $HOME/.nvm/nvm.sh

# Activate oh-my-zsh
source $ZSH/oh-my-zsh.sh

# remove auto-correct
unsetopt correct_all

# update dir_colors
eval `dircolors ~/.dir_colors`

# set color mode of terminal
export TERM=xterm-color

# add user-specific bin to PATH
export PATH=~/bin:$PATH

# set default terminal text editor
TE="emacsclient -t -a emacs"
export VISUAL=$TE

# shortcut for terminal emacs
alias e=$TE
# shortcut for terminal emacs with sudo
alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
# disable pattern expanding for lein
alias lein="noglob lein"

alias conkeror="xulrunner /usr/share/conkeror/application.ini"

# ZSH highlighter
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

# Notify when long command is finished
[ -e $HOME/.zsh-notifier/notifyosd.zsh ] && . $HOME/.zsh-notifier/notifyosd.zsh

# Activate rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Activate Node
nvm use 0.1 &> /dev/null
