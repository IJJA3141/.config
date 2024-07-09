export ZDOTDIR="/home/alexe/.config/zsh"

typeset -U PATH path

# zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export SUDO_PROMPT="sudo? :"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath

# default app
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox-developer-edition"
export TERMINAL="kitty"
export FILEBROWSER="ranger"

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_TEMPLATES_DIR="$HOME/templates"
export XDG_PUBLICSHARE_DIR="$HOME/public"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_VIDEOS_DIR="$HOME/videos"


# qt-gtk
export QT_STYLE_OVERRIDE="Adwaita-Dark"
export GTK_THEME="Adwaita:dark"

#windows stuff
export C="/mnt/c"
export D="/mnt/d"
export E="/mnt/e"
export HC="/mnt/c/Users/alexe/"
export HE="/mnt/e/Users/alexe/"
