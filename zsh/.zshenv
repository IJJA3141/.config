export ZDOTDIR="/home/alexe/.config/zsh"

typeset -U PATH path 

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox-developer-edition"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath

#windows stuff
export C="/mnt/c"
export D="/mnt/d"
export E="/mnt/e"
export HC="/mnt/c/Users/alexe/"
export HE="/mnt/e/Users/alexe/"
