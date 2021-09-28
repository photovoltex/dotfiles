# WIP

# dotfiles and small install guide

- a default arch installation ([guide](https://wiki.archlinux.org/title/installation_guide#Partition_the_disks))
- [`.dot-git-setup`](https://github.com/photovoltex/dotfiles/blob/main/.dot-git-setup) setups the git repo in the home dir 
- [`.dot-pkg-setup`](https://github.com/photovoltex/dotfiles/blob/main/.dot-pkg-setup) all pkg installation
## root setup (arch-chroot or after installation)
```shell
useradd -m <username>
passwd <username>
chsh -s /bin/zsh <username>
EDITOR=vim visudo
```
add the user to sudo via `visudo` (`EDITOR=vim visudo`) like `<username> ALL=(ALL) ALL` (see root entry) \
switch then to the created user

# user setup
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/photovoltex/dotfiles/main/.install)"
```
> accept every prompt

## packages
- base packages
  - networkmanager
  - sudo
  - git
  - zsh
  - vi
  - vim
- dev packages
  - base-devel
  - cmake
  - go
- x related packages
  - xorg
  - xorg-xinit
  - i3
  - rofi
  - picom
  - lightdm
  - lightdm-slick-greeter
- font packages
  - ttf-fira-sans
  - ttf-fira-code
- gui packages
  - kitty
  - nitrogen
  - firefox
  - nemo
  - code
- cli packages
  - unzip
  - bpytop
  - neofetch
  - lolcat
- yay packages
  - polybar
  - uwufetch
  - python-pip
  - python-pywal

> WIP packages
- [Chameleon](https://github.com/GideonWolfe/Chameleon)
  - oomox
  - pywal-discord
  - telegram-pallette-gen
  - [telegram-palette-gen](https://github.com/matgua/telegram-palette-gen)
  - [wal-discord](https://github.com/guglicap/wal-discord)
  - [pywalfox](https://github.com/Frewacom/Pywalfox)
  - [spicetify-cli](https://github.com/khanhas/spicetify-cli)

```
pacstrap /mnt base linux linux-firmware git sudo networkmanager vim vi zsh
```
```
sudo pacman -S \
    base-devel cmake go \
    xorg xorg-xinit i3 picom rofi lightdm lightdm-slick-greeter \
    ttf-fira-sans ttf-fira-code \
    kitty nitrogen firefox nemo code \
    unzip bpytop neofetch lolcat
```
```
yay -S polybar uwufetch python-pip python-pywal
```

## yay (yeah :D)
```shell
mkdir -p ~/Downloads/yay
git clone https://aur.archlinux.org/yay.git ~/Downloads/yay
cd ~/Downloads/yay
makepkg -f
sudo pacman -U ~/Downloads/yay/yay-?*.pkg.tar.zst
rm -rf ~/Downloads/yay
```

## virtualbox
- https://wiki.archlinux.org/title/VirtualBox
  ```
  sudo pacman -S virtualbox-guest-iso
  mount /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso /mnt
  cd /mnt
  ./VBoxLinuxAdditions.run
  ```
- sometimes you need `picom --experimental-backend` instead of `picom` (.config/i3/config)

## font
execute `fc-cache -vf` to cache all installed fonts

## lightdm
see [.dot-syl-setup](https://github.com/photovoltex/dotfiles/blob/main/.dot-syl-setup)
```
sudo usermod -aG $(whoami) lightdm
chmod g+rx ~
sudo rm -f /etc/lightdm/lightdm.conf
sudo ln -s ~/.config/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
sudo ln -s ~/.config/lightdm/slick-greeter.conf /etc/lightdm/slick-greeter.conf
sudo ln -s ~/Wallpapers/3440x1440p_neon.jpg /usr/share/pixmaps/3440x1440p_neon.jpg

systemctl enable lightdm
```
