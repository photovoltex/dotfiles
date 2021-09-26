#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/photovoltex/dotfiles/main/.dot-git-setup)"

./.dot-pkg-setup
./.dot-syl-setup

# reboot
