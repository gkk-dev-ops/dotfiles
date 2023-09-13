#!/bin/bash

# change default shell
chsh -s /bin/bash

# setup directory structure
mkdir "$HOME/bin"

# install development software
xcode-select --install
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/gkk/.profile
# Following line should append profile configuration, not be evaluated at this script runtime
# shellcheck disable=SC2016
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/gkk/.profile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off
brew install neovim
brew install neofetch

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install brew packages
brew install gcc
brew install python3
brew install shellcheck