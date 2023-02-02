zstyle ':znap:*' repos-dir ~/Repositories/zsh-snap
source ~/Repositories/zsh-snap/znap.zsh

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

if [ `tput colors` = "256" ]; then
   echo ""
   echo "  ／l、"
   echo "（ﾟ､ ｡ ７"
   echo "  l、ﾞ~ヽ"
   echo "  じしf_, )ノ"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/photovoltex/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# omz plugins
plugins=(
   git
   npm
)

source $ZSH/oh-my-zsh.sh


############################################
### User configuration
############################################

bindkey "^[[C" forward-word
bindkey "^[[D" backward-word

bindkey "^[D" forward-kill-word

# source wayland env
source /usr/local/bin/wayland_enablement.sh

# alias
alias la="ls -a"
alias pac="pacman"
alias pac2="sudo pacman -Qtdq | sudo pacman -Rns -"
alias pacup="yay -Syu"
alias pacclean="sudo pacman -Sc"

alias supac="sudo pacman"
alias supacs="sudo pacman -S"
alias supacr="sudo pacman -R"

alias icat="kitty +kitten icat"
alias fcat="kitty +list-fonts --psnames"

alias gpgkeygen="gpg --full-gen-key"

alias swayappids="swaymsg -t get_tree | grep 'app_id'"

alias src="omz reload"
alias upznap="znap pull"

alias netstat="nmcli d"
alias wifion="nmcli radio wifi on"
alias wifioff="nmcli radio wifi off"
alias wifishow="nmcli device wifi list"
alias wifidis="nmcli d disconnect wlp170s0"

alias hotspoton="nmcli radio wifi on && sleep 2 && nmcli device wifi hotspot ssid coffee-planet password 3o4rhio3non"
alias hotspotshow="nmcli device wifi show-password"

alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"

# env var for cmd use only -> possible cmd/bin paths
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.scripts/:$HOME/go/bin/:$PATH
# workaround to fix bad ls_colors set by theme
export LS_COLORS=""
