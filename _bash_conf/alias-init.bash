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
alias la='ls -aF'
alias ll='ls -alF'
alias findf='find -type f -name'
alias findd='find -type d -name'
alias grep='grep --color=auto --no-messages --binary-files=without-match'

# git
# --------------------------------------
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
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
