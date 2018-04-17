# $bash_conf/function-init.bash # 関数の設定
# --------------------------------------

# color
function parse_git_branch {
    type git > /dev/null 2>&1 | grep -i 'not found'
        if [ $? -eq 1 ] ; then
            \git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
        fi
}
function proml {
  pwd_str="$(pwd | sed -e "s|$HOME|~|")"
  prompt_str="[$(whoami)@$(hostname | cut -d'.' -f1):${pwd_str}$(parse_git_branch)]"
  cols=$(expr $(tput cols) - ${#prompt_str})
  margin=$(printf "%${cols}s" "[$(date +'%Y-%m-%d %H:%M:%S')]" | cut -d'[' -f1)
  PS1="[${COLOR_LIGHT_RED}\u${COLOR_NC}${COLOR_LIGHT_GRAY}@\h${COLOR_NC}:${COLOR_LIGHT_CYAN}\w${COLOR_NC}${COLOR_LIGHT_BLUE}$(parse_git_branch)${COLOR_NC}]${margin}${COLOR_LIGHT_GREEN}[$(date +"%Y-%m-%d") \t]${COLOR_NC}\n$ "
}
function cd_proml {
    \cd $1
    proml
}
alias cd='cd_proml'

# requre: w3m
function dic () {
  w3m "http://ejje.weblio.jp/content/$1" | grep -e '1 ' -e '2 ' -e '3 ' -e "とは" -e "用例"
}
function wiki () {
  w3m "https://ja.wikipedia.org/wiki/$1" | head -n 50 | tail -n 40
}

# カレントパス以下のディレクトリでGrepマッチしたディレクトリに移動します 
# -----------------------------------------
function jj () {
  if [ $1 ]; then
    JUMPDIR=$(find . -type d -maxdepth 1 | grep $1 | tail -1)
    if [[ -d $JUMPDIR && -n $JUMPDIR ]]; then
      cd $JUMPDIR
    else
      echo "directory not found"
    fi
  fi
}

# required pandoc + lynx (+ ~/.pandoc/)
rmd () {
  pandoc $1 -s --self-contained -t html5 -c github.css | lynx -stdin
}
pandoc_with_github () {
  pandoc $1 -s --self-contained -t html5 -c github.css 
}

#
# ---------------------------------------
function cleanup () {
  find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
  find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
}

# for mac
# Finderのアクティブウィンドウのパスにターミナルで移動します。
function cdf () {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]
  then
    cd "$target"
    pwd
  else
    echo 'No Finder window found' >&2
  fi
}

#zip
# --------------------------------------
function extract () {
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

