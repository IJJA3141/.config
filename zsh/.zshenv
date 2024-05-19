export ZDOTDIR="/home/alexe/.config/zsh"

typeset -U PATH path

export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export SUDO_PROMPT="?:"

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox-developer-edition"
export TERMINAL="kitty"
export FILEBROWSER="ranger"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

export QT_STYLE_OVERRIDE="Adwaita-Dark"
export GTK_THEME="Adwaita:dark"

#windows stuff
export C="/mnt/c"
export D="/mnt/d"
export E="/mnt/e"
export HC="/mnt/c/Users/alexe/"
export HE="/mnt/e/Users/alexe/"
