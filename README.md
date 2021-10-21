# dotfiles

Requires a default arch installation ([official guide](https://wiki.archlinux.org/title/installation_guide#Partition_the_disks)/[understandable guid](https://itsfoss.com/install-arch-linux/) (isn't perfect)).

Recommended `pacstrap` cmd.
```
pacstrap /mnt base linux linux-firmware git sudo networkmanager vim vi zsh
```



## root setup
> This section is recommended to execute during the installation. (during arch-chroot)
```shell
# create user with and home dir for the new user
useradd -m <username>
# set password for the new user
passwd <username>
# change the shell for the user to zsh
chsh -s /usr/bin/zsh <username>
# edit sudo so that the user has rights to execute cmd as root
# EDITOR=vim => visudo will use vim instead of vi
EDITOR=vim visudo
```
The last line opens the sudo configuration. Adding a line like `<username> ALL=(ALL) ALL` (see root entry) will give the new created user the permission to execute commands as root.

## user setup
The following cmd will execute the [`.install`](https://github.com/photovoltex/dotfiles/blob/main/.install) file on your local machine.
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/photovoltex/dotfiles/main/.install)"
```
> accept every prompt

## packages

```
sudo pacman -S \
    base-devel cmake go nodejs npm \
    xorg xorg-xinit i3 picom rofi lightdm lightdm-slick-greeter \
    kitty firefox feh zathura nemo flameshot telegram-desktop discord \
    blueman bluez bpytop neofetch \
    unzip playerctl xclip ntfs-3g otf-fira-sans ttf-hanazono nvidia-settings \
    lolcat cowsay
```
```
yay -S ncspot polybar uwufetch visual-studio-code-bin \
    python-pip python-pywal themix-full-git \ 
    nerd-fonts-jetbrains-mono ttf-symbola
```

> todo: add pulseaudio und pulseaudio gui mixer
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
  - nodejs
  - npm
  - rust (rust custom installation)
- x related packages
  - xorg
  - xorg-xinit
  - i3
  - rofi
  - picom
  - lightdm
  - lightdm-slick-greeter
- gui packages
  - kitty
  - firefox
  - feh
  - zathura
  - nemo
  - flameshot
  - telegram-desktop
  - discord
- bluetooth
  - bluez
  - blueman
- others
  - bpytop
  - neofetch
  - unzip
  - playerctl
  - xclip
  - ntfs-3g
  - otf-fira-sans
  - ttf-hanazono
  - nvidia-settings
- more or less useful stuff
  - lolcat
  - cowsay
- yay packages
  - ncspot
  - polybar
  - uwufetch
  - visual-studio-code-bin
  - python-pip
  - python-pywal
  - themix-full-git (oomox)
  - nerd-fonts-jetbrains-mono
  - ttf-symbola
- pywal additions
  - [pywalfox](https://github.com/Frewacom/Pywalfox)
  - [telegram-pallette-gen](https://github.com/agnipau/telegram-palette-gen)
    - [extension for firefox](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/)
- icon theme
  - [Tela-circle-icon-theme](https://github.com/vinceliuice/Tela-circle-icon-theme.git)

> gnome-keyring don't know if installation needed necessary

- recommended
  - parsec
  - piper
  - qemu
  - virt-manager

## virtualbox
- virtualbox doesn't support efi out of the box (important for `grub-install`)
```
# install the package to get guest support in virtualbox
sudo pacman -S virtualbox-guest-iso
# mount the installed iso
sudo mount /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso /mnt
cd /mnt
# execute the guest extension
sudo ./VBoxLinuxAdditions.run
```
- sometimes you need `picom --experimental-backend` instead of `picom` (.config/i3/config)

## font problems
execute `fc-cache -vf` to cache all installed fonts

## monitor
- example for an 21:9 1440p and 16:9 1080p monitor (session only)
  -  `xrandr --output DP-2 --mode 3440x1440 --output HDMI-0 --mode 1920x1080 --pos 3440x360`
-  `nvidia-settings` (pac) recommended for easy multi monitor setup if u use a nvidia gpu
