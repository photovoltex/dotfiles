# WIP

# dotfiles and small install guide

- a default arch installation ([guide](https://wiki.archlinux.org/title/installation_guide))

- [`.dot-pkg-setup`](https://github.com/photovoltex/dotfiles/blob/main/.dot-pkg-setup) all pkg installation
## root setup
```shell
useradd -m <username>
passwd <username>
```
add the user to sudo via `visudo` (`EDITOR=vim visudo`) like `<username> ALL=(ALL) ALL` (see root entry) \
switch then to the created user

## dotfiles setup
execute in `~/`
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/photovoltex/dotfiles/main/.dot-git-setup)"
```
## packages
- networkmanager
- sudo
- git
- zsh
- vi
- vim
- base-devel
- cmake
- go
- unzip
- xorg
- xorg-xinit
- i3
- rofi
- picom
- lightdm
- lightdm-slick-greeter
- kitty
- nitrogen
- bpytop
- firefox 
- thunar
- code
- neofetch
- ttf-hack
- yay
  - polybar
  - uwufetch

```
pacstrap /mnt base linux linux-firmware git sudo networkmanager vim vi zsh
```
```
pacman -S base-devel cmake go unzip \
xorg xorg-xinit i3 rofi picom lightdm lightdm-slick-greeter \
kitty nitrogen bpytop firefox thunar code neofetch ttf-hack
```
```
yay -S polybar uwufetch
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
