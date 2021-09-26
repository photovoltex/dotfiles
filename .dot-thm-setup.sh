#!/bin/sh

# icons
mkdir -p ~/Downloads
curl https://codeload.github.com/EliverLara/candy-icons/zip/refs/heads/master -o ~/Downloads/candy-icons.zip
mkdir -p ~/.local/share/icons
unzip ~/Downloads/candy-icons.zip -d ~/.local/share/icons
mv ~/.local/share/icons/candy-?* ~/.local/share/icons/candy-icons

curl -L https://github.com/EliverLara/Sweet/releases/download/2.0/Sweet-Dark.tar.xz -o ~/Downloads/sweet-dark
mkdir -p ~/.local/share/themes

cd ~/.local/share/themes
tar xf ~/Downloads/sweet-dark.tar.xz
