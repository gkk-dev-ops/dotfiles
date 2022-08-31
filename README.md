# dotfiles

## Usage

```bash
mkdir dev
cd dev

git clone git@github.com:gkk-dev-ops/.dotfiles.git

# for all those dotfiles you want to take from repository
# https://stackoverflow.com/questions/46534290/symlink-dotfiles
ln -s -f ~/dotfiles/.dot_file_name ~/.dot_file_name
# e.g.:
ln -s -f ~/dev/dotfiles/.bash_aliases ~/.bash_aliases
ln -s -f ~/dev/dotfiles/.bashrc ~/.bashrc
ln -s -f ~/dev/dotfiles/.gitconfig ~/.gitconfig
ln -s -f ~/dev/dotfiles/.profile ~/.profile

bash setup_start.sh
```