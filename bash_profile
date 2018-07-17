# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Aliases
alias ls='ls -GFh'
alias ll='ls -lG'
alias a='alias'
alias reset="osascript -e 'tell application \"System Events\" to tell process \"Terminal\" to keystroke \"k\" using command down'" # Because mac doesn't have reset by default
alias r='reset'
alias rm='rm -i' # prompt before deleting
alias c='clear'
alias grep="grep --color"
alias .='pwd'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias eb='vim ~/.bash_profile' # Make sure to change to bashrc for linux
alias ev='vim ~/.vimrc'
alias sb='source ~/.bash_profile' # Make sure to change for Linux
alias rubo-check='git diff-tree -r --no-commit-id --name-only head origin/master | xargs rubocop'
alias rubo-correct='git diff-tree -r --no-commit-id --name-only head origin/master | xargs rubocop --auto-correct'

# Display git branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="[\u@\[\033[36m\]\h\[\033[33m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]\$ " #Prompt with git branch and $
#export PS1=" \[\033[36m\]\u \[\033[33m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] >> " # Prompt with git branch and >>
export PS1=" \[\033[36m\]\u \[\033[33m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] >> " # Prompt w/ pwd and git branch

# Set Vi Mode
set -o vi
bind 'set show-mode-in-prompt on' # needs updated bash if on mac

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

