#######################################################
##  Bash Script for setting up a Mac for development ##
#######################################################
echo "Setting up mac"

# homebrew
which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing brew"
  /usr/bin/ruby -e "$(curl -fssl https://raw.githubusercontent.com/homebrew/install/master/install)"
else
    brew update
fi

# cask
if brew info brew-cask &>/dev/null; then
  echo "Tapping into cask"
  brew tap caskroom/cask;
fi

echo "Installing essential programs"
brew cask install iterm2 spectacle spotify hyperswitch;
brew install rg htop tmux vim ctags;
brew link vim; # override system provided vim

echo "Setting up fzf"
brew install fzf
$(brew --prefix)/opt/fzf/install

if [ ! -d ~/git ]; then
  echo "Making git folder"
  mkdir ~/git
fi

if [ ! -d ~/git/dotFiles ]; then
  echo "Getting Dot files"
  git clone https://github.com/JamesSolum/dotFiles.git ~/git/dotFiles/;

  # Vundle for vimrc
  if [ -f ~/.vim/bundle/vundle.vim ]; then
    echo "Installing Vundle (vim plugin manager)"
    git clone https://github.com/vundlevim/vundle.vim.git ~/.vim/bundle/vundle.vim;
    vim +PluginInstall +qall # Install vim plugins
  fi

  # Tmux
  if [ -f ~/.tmux ]; then
    echo "Installing TPM (tmux package manager)"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi


  echo "Sym linking dot files"
  #Choose which script to symlink based

  # Installing Airline Fonts
  git clone https://github.com/powerline/fonts.git ~/git/fonts/;
  cd ~/git/fonts
  sh ./install.sh

  echo "Powerline fonts have now been installed"
  echo "IMPORTANT:"
  echo "to utilize the powerline fonts, you must open"
  echo "iterm2. Navigate to preferences, profiles,"
  echo "text, and check different font for non-ascii "
  echo "characters. Then restart iterm2, open the"
  echo "the same font window, change font for non-"
  echo "ascii characters, and choose any of the  "
  echo "powerline fonts (it doesn't matter what you"
  echo "choose they all look the same). Then restart"
  echo "iterm2 and now Airline will look pretty!!"
fi

# Mac doesn't have updated bash
if [ "${BASH_VERSINFO:-0}" -lt 4 ]; then # if bash version is less than 4
  brew update && brew install bash
  sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
  chsh -s /usr/local/bin/bash
  #Needs reboot
fi
