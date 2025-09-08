# File system
alias rm="rm -i"
alias ls="ls --color=auto"
alias lsa="ls -vahl --color=auto --group-directories-first"

# Zip
alias lz="unzip -l"
alias lt="tar -tvf"
alias ungz="tar -xzvf"
alias untar="tar -xvf"

# Git
alias gr="git rm . --cached -rf >> /dev/null"
alias ga="git add . && git commit -m \'$1\' && git push"

# Other
alias ssh="kitten ssh"
alias lambda="echo λ && wl-copy λ"
alias wifi="zsh ~/.config/scripts/fuckwifi.sh"
alias keybinds="cat ~/.config/hypr/input.conf"
alias x11="export GDK_BACKEND=x11"
alias ff="firefox-developer-edition >> /dev/null &"
alias template="~/.config/scripts/template.sh"

# Functions
function gitlog
{
    logs="$(git log | grep '[0-99]\.[0-99]')"

    for ((i = "$(echo $logs | wc -l)"; i > 0; i--)); do
        echo $logs | sed "${i}q;d"
    done
}

function asciisize
{
    row=$(sed -e 's/\x1b\[[0-9;]*m//g' $1 | wc -l)
    column=$(sed -e 's/\x1b\[[0-9;]*m//g' $1 | wc -L)

    echo "row: ${row}\ncolumn: ${column}"
}

function forallfiles()
{
    files=($(find ./ -exec ls -d $PWD/{} \;))

    for ((i = 2 ; i <= ${#files[@]} ; i++ )); do
        echo "$1 $files[i]"
        eval "$1 $files[i]"
    done
}

function cleantex
{
  rm *.aux *.log *.gz *.fdb_latexmk *.fls
}

function queen
{
  arr=("💅💎" "✨🔥🎀💅💝💕", "🙄💅✨" "💅✨baddie✨💅" "👁️🫦👁️💅" "꧁𝔂𝓪𝓼𝓼 𝓺𝓾𝓮𝓮𝓷꧂" "🤗")
  index="$((RANDOM % $#arr + 1))"
  echo "$arr[index]"
  wl-copy "$arr[index]"
}

# Functions Alias
alias forfiles=foreachfiles
alias texclean=cleantex
alias gl=gitlog
alias lc=asciisize
alias slayqueen=queen
