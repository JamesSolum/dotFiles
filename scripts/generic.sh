#!/bin/bash
############################################################
#
# Description:  Generic Configuration Script
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

# Fzf setup
ln -s git/dotFiles/fzf.bash .fzf.bash

# Logic for Setting up System Variables
# TODO
