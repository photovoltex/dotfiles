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


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/photovoltex/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   git
   dotenv
   npm
)

source $ZSH/oh-my-zsh.sh

# 
### User configuration
# 

# https://unix.stackexchange.com/a/313812
# real-backward-delete-word () {
#    local WORDCHARS='~!#$%^&*(){}[]<>?+;'
#    zle backward-delete-word
# }
# zle -N real-backward-delete-word

bindkey "^[[C" forward-word
bindkey "^[[D" backward-word

bindkey "^[D" forward-kill-word
# alt+backspace works and strg (not holding) + backspace
# bindkey '^?' real-backward-delete-word

source /etc/environment

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# alias
alias la="ls -a"
alias pac="pacman"
alias pac2="sudo pacman -Qtdq | sudo pacman -Rns -"
alias supacs="sudo pacman -S"
alias supacr="sudo pacman -R"

alias edit-kernel-parameters="sudo vim /boot/loader/entries/2022-03-04_17-21-45_linux.conf"

alias icat="kitty +kitten icat"
alias fcat="kitty +list-fonts --psnames"

alias src="omz reload"
alias upznap="znap pull"

alias netstat="nmcli d"
alias wifion="nmcli radio wifi on"
alias wifioff="nmcli radio wifi off"
alias wifishow="nmcli device wifi list"
alias wifidis="nmcli d disconnect wlp170s0"

alias hotspoton="nmcli radio wifi on && sleep 2 && nmcli device wifi hotspot ssid coffee-planet password 3o4rhio3non"
alias hotspotshow="nmcli device wifi show-password"

export LS_COLORS=""
