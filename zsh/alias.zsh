function fl ()
{
    logs="$(git log | grep '[0-99]\.[0-99]')"

    for ((i = "$(echo $logs | wc -l)"; i > 0; i--)); do
        echo $logs | sed "${i}q;d"
    done
}

alias lsa="ls -vahl --color=auto --group-directories-first"
alias ls="ls --color=auto"
alias gr="git rm . --cached -rf >> /dev/null && git add . >> /dev/null && git ls-files"
alias gl=fl
