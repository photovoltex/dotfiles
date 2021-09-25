# Overall WIP

# dotfiles and small install guide
## packages
```
networkmanager sudo base-devel wget git cmake zsh vi vim ttf-hack xorg xorg-xinit i3 picom lightdm lightdm-slick-greeter firefox code neofetch
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
mkdir ~/Download/yay
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
