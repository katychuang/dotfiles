#!/bin/bash
#title          :new_mac.sh
#description    :This script will configure a new mac.
#author         :katychuang
#==================================================================================

set -e
trap result SIGKILL SIGTERM

RESET_COLOR="\033[0m"
RED_COLOR="\033[0;31m"
GREEN_COLOR="\033[0;32m"
BLUE_COLOR="\033[0;34m"

function reset_color() {
    echo -e "${RESET_COLOR}\c"
}

function red_color() {
    echo -e "${RED_COLOR}\c"
}

function green_color() {
    echo -e "${GREEN_COLOR}\c"
}

function blue_color() {
    echo -e "${BLUE_COLOR}\c"
}

function separator() {
    green_color
    echo "#=============================STEP FINISHED=============================#"
    reset_color
}

function hello() {
  green_color
  echo "Starting install"
  blue_color
  echo "This script will guide you through the installation process"
  
  green_color
  read -p "Do you want to proceed with installation? (y/N) " -n 1 answer
  echo
  if [ ${answer} != "y" ]; then
    exit 1
  fi

    reset_color
}

function result() {
    red_color
    echo
    echo -e "Error during install."

    reset_color
    exit 1
}

function install() {

	# install brew
	if [[ $(command -v brew) == "" ]] ; then
	    echo "Installing Hombrew"
	    # Install Homebrew
	    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
	    echo "Updating Homebrew"
	    brew update
	fi

	brew tap homebrew/bundle
	brew bundle
	brew install mas
	ln -s brew/Brewfile Brewfile
	brew bundle install

	#brew doctor

	# ==============================================================================
	# Shell environment setup

	if [ "$1" != "-zsh" ]; then
	  echo "Setting shell version to zsh"
	  sudo sh -c "echo $(which zsh) >> /etc/shells"
	  # install oh my #!/usr/bin/env zsh
	  sudo curl -L http://install.ohmyz.sh | sh
	else
	  echo "Setting shell version to fish"
	  sudo sh -c "echo $(which fish) >> /etc/shells"
	  # install oh-my-fish
	  curl -L https://get.oh-my.fish | fish

	  # install omf packages
	  omf install bang-bang
	  omf install cd
	  # omf install copy
	  omf install fasd
	  omf install grc
	  omf install https://github.com/jhillyerd/plugin-git
	  omf install keychain
	  # omf install pip
	  # omf install python
	  # omf install ssh
	  # omf install virtualfish
	  omf install weather

          # iterm shell integration
          # https://www.iterm2.com/documentation-shell-integration.html
          curl -L https://iterm2.com/shell_integration/fish -o ~/.iterm2_shell_integration.fish
          echo "source ~/.iterm2_shell_integration.(basename $SHELL)" >> ~/.config/fish/config.fish

	fi

	# Data Science Set up
	# Google Cloud SDK from https://cloud.google.com/sdk/docs/
	# curl https://sdk.cloud.google.com | bash
	# add ~/google-cloud-sdk/ to path
	# touch ~/.config/fish/config.fish
	# echo "export PATH=$PATH:~/google-cloud-sdk/" >> ~/.config/fish/config.fish

	# Anaconda https://repo.anaconda.com/archive/Anaconda3-5.2.0-MacOSX-x86_64.pkg



	# ==============================================================================
	# Haskell Development Tools

	# install haskell Stack
	curl -sSL https://get.haskellstack.org/ | sh
	# install nix
	curl https://nixos.org/nix/install | sh

	# ==============================================================================
	# Elm Language Development

	# install elm v18 as v19 is not stable yet
	npm install --global elm@0.18.0

	# ==============================================================================
	# Aliases
	alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

}

hello
install
result
