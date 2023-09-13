mkdir dev
cd dev
git clone https://github.com/gkk-dev-ops/dotfiles.git

# Create symlinks to dotfiles in home directory:
# e.g.
# ln -s -f ~/dotfiles/.dot_file_name ~/.dot_file_name
ln -s -f ~/dev/dotfiles/.bash_aliases ~/.bash_aliases
ln -s -f ~/dev/dotfiles/.bashrc ~/.bashrc
ln -s -f ~/dev/dotfiles/.gitconfig ~/.gitconfig
ln -s -f ~/dev/dotfiles/.profile ~/.profile
ln -s ~/dev/dotfiles/bin ~/bin

bash setup_start.sh