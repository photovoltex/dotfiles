# Overall WIP

# dotfiles and small install guide

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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/photovoltex/dotfiles/main/.dot-git-setup.sh)"
```
or
```shell
git init
git branch -m main
git remote add origin https://github.com/photovoltex/dotfiles.git
git fetch
git submodule update --init
```

## packages
```
pacstrap /mnt base linux linux-firmware git sudo networkmanager vim vi
```
`.dot-pkg-setup.sh` is a setup file for installing all packages below and builds the yay package
```
base-devel wget cmake zsh ttf-hack xorg xorg-xinit i3 picom lightdm lightdm-slick-greeter firefox code neofetch
```
- networkmanager
- sudo
- base-devel
- wget
- git
- cmake
- zsh
- vi
- vim
- ttf-hack
- xorg
- xorg-xinit
- i3
- picom
- lightdm
- lightdm-slick-greeter
- firefox 
- code
- neofetch

## yay (yeah :D)
### install
```shell
mkdir -p ~/Download/yay
git clone https://aur.archlinux.org/yay.git ~/Download/yay
cd ~/Download/yay
makepkg
```
install it then with `pacman -U <compiled yay pkg>` \
afterwards u can remove the yay dir
### packages
```
yay -S polybar uwufetch
```
- polybar
- uwufetch

## virtualbox
- https://wiki.archlinux.org/title/VirtualBox
  ```
  sudo pacman -S virtualbox virtualbox-guest-iso
  mount /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso /mnt
  /mnt/VBoxLinuxAdditions.run
  ```
- instead of `picom` -> `picom --experimental-backend` (.config/i3/config)
  - dotn know if picom will actually work... did only test it in an vm so far... WIP and so 

## font
run `fc-cache -vf` to find all fonts installed

# WIP

## lightdm
### setting up the greeter

```
sudo usermod -aG $(whoami) lightdm
chmod g+rx ~
sudo ln -s ~/.config/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
sudo ln -s ~/Wallpapers/3440x1440p_neon.jpg /usr/share/pixmaps/3440x1440p_neon.jpg
```
```
/etc/lightdm/lightdm.conf
---------------------------------------
[Seat:*]
...
greeter-session=lightdm-slick-greeter
...
logind-check-graphical=true
```

### enable
```
systemctl enable lightdm
```
