# MY ALIASES

# INFO =====================
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
# ==========================


# DIRECTORIES AND FILES ====
# recursive directory listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
lt() {
    ls -ltrsa "$@" | tail;
}

# delete all "*.pyc" files ;)
alias delpyc='find . -name "*.pyc" -delete'

# jump back n directories at a time
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# go back x directories
b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}

# show hidden files only
alias l.='ls -d .* --color=auto'

# list all folders
alias lf='ls -Gl | grep ^d'
alias lsd='ls -Gal | grep ^d'

# make and cd into directory
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# safe rm
alias rm='rm -I'

# find the biggest in a folder
alias ds='du -ks *|sort -n'
# ==========================

# make diff into ~/diffs/
dodiff() {
    if [ ! -d ~/diffs ]; then
        mkdir -p ~/diffs
    fi

    branch=`git rev-parse --abbrev-ref HEAD`
    git diff $1 > ~/diffs/$branch-$1.diff
}


# TERMINAL =================
alias c='clear'

psgrep() {
    ps axuf | grep -v grep | grep "$@" -i --color=auto;
}

fname() {
    find . -iname "*$@*";
}

# show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
# ==========================

# USEFUL ALIAS FOR EXTRACT KNOW ARCHIVES
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
# ==========================

# alias for kubectl
alias k="kubectl"
