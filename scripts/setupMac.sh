#!/bin/bash
############################################################
#
# Description:  Generic Apple Terminal Configuration Script
# Author:       James Solum
#
############################################################

# Setup Vimrc
ln -s ~/git/dotFiles/vimrc ~/.vimrc

# Setup Git Config 
ln -s ~/git/dotFiles/gitconfig  ~/.gitconfig

# Setup Tmux Config
ln -s ~/git/dotFiles/tmux.conf ~/.tmux.conf

# Setup Bashrc
ln -s ~/git/dotFiles/bashrc ~/.bashrc

# Setup System variables
ln -s ~/git/dotFiles/system_variables/work_vars ~/.custom_system_vars

# Setup Generic Mac Profile
ln -s ~/git/dotFiles/custom_bash_configs/mac_generic_profile ~/.bash_profile
