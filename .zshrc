#------------------------------
# Instant Prompt
#------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#------------------------------
# Paths
#------------------------------
ZDOTDIR=${ZDOTDIR:-${HOME}}
#ZSHDDIR="${HOME}/.config/zsh.d"
if ! [[ "${PATH}" =~ "^${HOME}/bin" ]]; then
    export PATH="${HOME}/bin:${PATH}"
fi
export XDG_CONFIG_HOME="$HOME/.config"
#------------------------------
# History stuff
#------------------------------
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"

# Ignore duplicate in history.
setopt hist_ignore_dups

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

#------------------------------
# Variables
#------------------------------
export BROWSER="firefox"
export EDITOR="gvim"
export PATH="${PATH}:${HOME}/bin"

#------------------------------
# General Setting
#------------------------------
setopt beep nomatch
setopt noflowcontrol

# extended globbing, awesome!
setopt extendedGlob

# zmv -  a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Prevent insert key from changing input mode.
# (switch to Emacs mode)
bindkey -e

#------------------------------
# Completion
#------------------------------
zstyle :compinstall filename '/home/ecmatthee/.zshrc'

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true

setopt COMPLETE_ALIASES

#------------------------------
# Prompt
#------------------------------
autoload -Uz promptinit
promptinit

# Colors.
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

#------------------------------
# Functions
#------------------------------

# Shutdown Confirmation{
confirm() {
    local answer
    echo -ne "zsh: sure you want to run '${YELLOW}$*${NC}' [yN]? "
    read -q answer
        echo
    if [[ "${answer}" =~ ^[Yy]$ ]]; then
        command "${@}"
    else
        return 1
    fi
}

confirm_wrapper() {
    if [ "$1" = '--root' ]; then
        local as_root='true'
        shift
    fi

    local prefix=''

    if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi
    confirm ${prefix} "$@"
}

poweroff() { confirm_wrapper --root $0 "$@"; }
reboot() { confirm_wrapper --root $0 "$@"; }
hibernate() { confirm_wrapper --root $0 "$@"; }
# }

# launch an app
function launch {
	type $1 >/dev/null || { print "$1 not found" && return 1 }
	$@ &>/dev/null &|
}

# Find IP address
function myip {
	local api
	case "$1" in
		"-4")
			api="http://v4.ipv6-test.com/api/myip.php"
			;;
		"-6")
			api="http://v6.ipv6-test.com/api/myip.php"
			;;
		*)
			api="http://ipv6-test.com/api/myip.php"
			;;
	esac
	curl -s "$api"
	echo # Newline.
}

# Unzip any archive
x () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *.xz)        xz -d $1       ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Full system update
function sys-update () {
    # Mirror list
    sudo reflector --verbose --latest 100 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

    # Pacman
    sudo pacman -Syu

    # Remove Orphans
    sudo pacman -Rs $(pacman -Qqtd) ## Monitor before confirm --> (sudo pacman -D --asexplicit <package-name>) to add packages to explict list (de-orphanize, AKA adopt)

    # AUR update
    yay -Syu

    # AUR clean
    yay -Yc

    # Vim plugin update
    vim -c :PlugInstall -c :PlugUpdate -c :qa
}

# Backup system
function sys-backup () {

    date=$(date +"%Y-%m-%d")

    # Onedrive (Full History)
    rclone sync /home/ecmatthee/.ssh onedrive:backup/$date/.ssh -P
    rclone sync /home/ecmatthee/dev onedrive:backup/$date/dev -P
    rclone sync /home/ecmatthee/proj onedrive:backup/$date/proj -P

    rclone sync /home/ecmatthee/root/arc onedrive:backup/$date/root/arc -P
    rclone sync /home/ecmatthee/root/data onedrive:backup/$date/root/data -P
    rclone sync /home/ecmatthee/root/doc onedrive:backup/$date/root/doc -P
    rclone sync /home/ecmatthee/root/misc onedrive:backup/$date/root/misc -P

    # Onedrive (Recent)
    rclone sync /home/ecmatthee/.ssh onedrive:backup/latest/.ssh -P
    rclone sync /home/ecmatthee/dev onedrive:backup/latest/dev -P
    rclone sync /home/ecmatthee/proj onedrive:backup/latest/proj -P

    rclone sync /home/ecmatthee/root/arc onedrive:backup/latest/root/arc -P
    rclone sync /home/ecmatthee/root/data onedrive:backup/latest/root/data -P
    rclone sync /home/ecmatthee/root/doc onedrive:backup/latest/root/doc -P
    rclone sync /home/ecmatthee/root/misc onedrive:backup/latest/root/misc -P

    # Mega (Most recent)
    rclone sync /home/ecmatthee/.ssh mega:backup/.ssh -P
    rclone sync /home/ecmatthee/dev mega:backup/dev -P
    rclone sync /home/ecmatthee/proj mega:backup/proj -P

    rclone sync /home/ecmatthee/root/arc mega:backup/root/arc -P
    rclone sync /home/ecmatthee/root/data mega:backup/root/data -P
    rclone sync /home/ecmatthee/root/doc mega:backup/root/doc -P
    rclone sync /home/ecmatthee/root/misc mega:backup/root/misc -P
}

# Backup system
function sys-restore () {
    rclone sync onedrive:backup/latest/.ssh /home/ecmatthee/.ssh -P
    rclone sync onedrive:backup/latest/dev /home/ecmatthee/dev -P
    rclone sync onedrive:backup/latest/proj /home/ecmatthee/proj -P

    rclone sync onedrive:backup/latest/root/arc /home/ecmatthee/root/arc -P
    rclone sync onedrive:backup/latest/root/data /home/ecmatthee/root/data -P
    rclone sync onedrive:backup/latest/root/doc /home/ecmatthee/root/doc -P
    rclone sync onedrive:backup/latest/root/misc /home/ecmatthee/root/misc -P
}


# Pacman installed package browser
function browse-packages () {
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}

# Get Weather
function wttr () {
    curl wttr.in/$1
}

function star-wars() {
    # Ctrl-] to stop --> q to quit telnet
    telnet towel.blinkenlights.nl
}

#------------------------------
# Alias
#------------------------------
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

#------------------------------
# Plugins Load
#------------------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#------------------------------
# Plugins Config
#------------------------------
## zsh-history-substring-search
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down


#------------------------------
# Power
#------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#------------------------------
# System
#------------------------------

# SSH Agent >> Keychain
eval $(keychain --eval --quiet /home/ecmatthee/.ssh/arch_gitlab /home/ecmatthee/.ssh/arch_github)
