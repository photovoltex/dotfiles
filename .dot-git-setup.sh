git init
git branch -m main
git remote add origin https://github.com/photovoltex/dotfiles.git
git fetch
git checkout -t origin/main
git submodule update --init
chsh -s $(which zsh)
source .zshrc
