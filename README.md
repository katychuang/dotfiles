# dotfiles

My personal configurations for emacs, vim, etc

This was started to help me remember how to set up new installations of things, and also as something to share with others who are starting to learn how to set up their machines for the first time for development.

Eventually I'd like to automate the installations but for now I've got examples of the configuration settings here in this repo.

# Notes

## Homebrew

Preferred way of installing apps and libraries is with [Homebrew]() where possible.

[Homebrew-Bundle](https://github.com/Homebrew/homebrew-bundle) is useful, so is [mas-cli](https://github.com/mas-cli/mas)

## Git config

```
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
```

## Emacs
These settings are typically saved in ~/.emacs or ~/.emacs.d/init.el

## Vim
These settings are typically saved in ~/.vimrc


# New Mac Machine

A bunch of things are installed for first time use, see `new_mac.sh` script. Installations are pulled from Homebrew where possible.


