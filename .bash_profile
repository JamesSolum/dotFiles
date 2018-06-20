# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Aliases
alias ls='ls -GFh'
alias ll='ls -lG'
alias reset="osascript -e 'tell application \"System Events\" to tell process \"Terminal\" to keystroke \"k\" using command down'"
alias rm='rm -i'

# Git Aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'

# Display git branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="[\u@\[\033[36m\]\h\[\033[33m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]\$ " #Add display of current git branch to the command line
export PS1=" \[\033[36m\]\u \[\033[33m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] >> " #Add display of current git branch to the command line

# Set Vi Mode
set -o vi
bind 'set show-mode-in-prompt on'

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
# REQUIRES fzf.
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

