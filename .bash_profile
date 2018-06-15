# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Aliases
alias ls='ls -GFh'
alias ll='ls -lG'
alias reset="osascript -e 'tell application \"System Events\" to tell process \"Terminal\" to keystroke \"k\" using command down'"
alias rm='rm -i'

# Display git branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="[\u@\[\033[36m\]\h\[\033[33m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]\$ " #Add display of current git branch to the command line
export PS1=" \[\033[36m\]\u \[\033[33m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] >> " #Add display of current git branch to the command line

# Set Vi Mode
set -o vi
bind 'set show-mode-in-prompt on'

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
