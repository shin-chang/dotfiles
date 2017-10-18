# $bash_conf/alias-init.bash: aliasの設定
# ---------------------------------------

# alias
# --------------------------------------
alias ..1='cd ..'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'
alias ..6='cd ../../../../../../'
alias ..7='cd ../../../../../../../'
alias ..8='cd ../../../../../../../../'
alias ff='find . -type f -name'
alias fd='find . -type d -name'
alias grep='grep --color=auto --no-messages --binary-files=without-match'
alias hn='head -n'
alias tn='tail -n'
alias sb='source ~/.bashrc'
alias md='vim ./*.md'
alias up="cd ..; ls -l"
alias cdl='a=(`ls -1`) ; ls -1 | cat -n ; read b ; cd ${a[$b-1]}'
alias rgrep='find . -name "*.svn*" -prune -o -type f -print0 | xargs -0 grep'
alias ml='vim -c MemoNew '
# ls
if [ "$(uname)" = 'Darwin' ]; then # for mac
  export LSCOLORS=xbfxcxdxbxegedabagacad
  alias ls='ls -G'
  alias la='ls -aF -G'
  alias ll='ls -alF -G'
else # for linux
  alias ls='ls --color=auto'
  alias la='ls -aF --color=auto'
  alias ll='ls -alF --color=auto'
fi

# require: translate-shell
alias toj="trans {en=ja}"
alias toe="trans {ja=en}"

# require: aria2
alias dl='time aria2c -x10'

# require: z
alias j="z"

# for mac
alias f="open ."

# front-end
# --------------------------------------
alias nr='npm run-script'
# git
# --------------------------------------
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gll='git pull'
alias glr='git pull --recursive'
alias gps='git push'
alias gdc='git diff --cached'
alias gdn='git diff --name-status'
alias gl='git log'
alias gb='git branch'
alias gco='git checkout'
alias gcom='git checkout master'
alias gsh='git show'
alias gs='git status'
alias gm='git mergetool'
alias gri='git rebase -i'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gcp='git cherry-pick'
alias gsb='git show-branch --current'

# django
# --------------------------------------
alias sd='source deactivate'
alias venv='source ./myvenv/bin/activate'
alias rs='python manage.py runserver 0.0.0.0:8000'
