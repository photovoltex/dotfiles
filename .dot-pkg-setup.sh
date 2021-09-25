sudo pacman -S base-devel wget cmake zsh ttf-hack xorg xorg-xinit i3 picom lightdm lightdm-slick-greeter firefox code neofetch
mkdir -p ~/Download/yay
git clone https://aur.archlinux.org/yay.git ~/Download/yay
cd ~/Download/yay
makepkg
