xcode-select --install

# install brew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew doctor

# install oh my #!/usr/bin/env zsh
sudo curl -L http://install.ohmyz.sh | sh

# install haskell Stack
curl -sSL https://get.haskellstack.org/ | sh
