#!/bin/bash

# install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

fi

# ==============================================================================
# Data Science Set up (currently using Homebrew Bundle)

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
