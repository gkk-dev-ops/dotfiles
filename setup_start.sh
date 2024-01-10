#!/bin/bash

# change default shell
chsh -s /bin/bash

# setup directory structure
mkdir "$HOME/dev"
cd "$HOME/dev"

git clone https://github.com/gkk-dev-ops/dotfiles.git

# Create symlinks to dotfiles in home directory:
# e.g.
# ln -s -f ~/dotfiles/.dot_file_name ~/.dot_file_name
ln -s -f "$HOME/dev/dotfiles/.bash_aliases" $HOME/.bash_aliases
ln -s -f $HOME/dev/dotfiles/.bashrc $HOME/.bashrc
ln -s -f $HOME/dev/dotfiles/.gitconfig $HOME/.gitconfig
ln -s -f $HOME/dev/dotfiles/.profile $HOME/.profile
ln -s $HOME/dev/dotfiles/bin $HOME/bin


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
if command -v brew --version >/dev/null 2>&1; then
    brew install gcc
    brew install python3
    brew install shellcheck
else
    echo "Brew is not installed. Please install Brew first."
fi

if command -v code --version >/dev/null 2>&1; then
    chmod +x dotfiles/setup_vscode.sh
    bash setup_vscode.sh
else
    echo "VS Code is not installed. Please install VS Code and ADD TO PATH as \"code\" first."
fi

