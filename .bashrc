export PYTHONSTARTUP=${HOME}/.pyrc.py
# python virtualenv
export WORKON_HOME=${HOME}/venvs
# python virtualenvwrapper
case "$OSTYPE" in
    darwin*)
source /usr/local/bin/virtualenvwrapper.sh
;;
    linux*)
source /usr/local/bin/virtualenvwrapper.sh
;;
    cygwin*)
source /usr/bin/virtualenvwrapper.sh
;;
esac
# python install pip
export PIP_DOWNLOAD_CACHE=${HOME}/.pip_cache
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUELENV=true
export VERSIONER_PYTHON_PREFER_32_BIT=no
alias py='python'
alias bpy='bpython'

export LANG=ja_JP.UTF-8

case "$OSTYPE" in
    darwin*)
alias l="ls -G"
alias ls="ls -G"
;;
    linux*)
alias l="ls --color=auto"
alias ls="ls --color=auto"
;;
    cygwin*)
alias l="ls --color=auto"
alias ls="ls --color=auto"
;;
esac

# alias
alias le="less"
alias c="cd .."
alias lsa='ls -A'
alias lsl='ls -l'
alias s='sudo'
alias so='source'

alias hal='sudo shutdown -h now'

alias tarx='tar xzvf'
alias tarc='tar czvf'

alias ta='tmux attach'
alias tmux='tmux -2'

alias gr='find . | xargs grep -ni $1'
alias psgr='ps aux | grep'

alias hgb='hg pull; hg up; hg branch'

alias gi='git'

# for bash_completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi

# brew install bash_completion
# prompt command
hg_branch() {
    hg branch 2> /dev/null | awk '{print "(hg:" $1 ")"}'
}

git_branch() {
    __git_ps1 '(git:%s)'
}

# setting for prompt
case "$OSTYPE" in
    darwin*)
if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
    echo "git-completion enabled..."
    PS1="\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \$(git_branch)\$(hg_branch) \[\033[0;32m\]\w\[\033[0;37m\]]\$ "
else
    PS1="\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \[\033[0;32m\]\w\[\033[0;37m\]]\$ "
fi
;;
    linux*)
if [ -f $BASH_COMPLETION_DIR/git ]; then
    source $BASH_COMPLETION_DIR/git
    echo "git-completion enabled..."
    PS1="\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \$(git_branch)\$(hg_branch) \[\033[0;32m\]\w\[\033[0;37m\]]\$ "
else
    PS1="\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \[\033[0;32m\]\w\[\033[0;37m\]]\$ "
fi
;;
esac

export PS1

# crontab -r freeze
function crontab() {
  for opt in "$@"; do
    if [ "$opt" == "-r" ]; then
      echo '-r is sealed!'
      return 1
    fi
  done
  command crontab "$@"
}

export PATH=/Users/altnight/work/a/Sencha/Cmd/3.0.0.250:$PATH

export SENCHA_CMD_3_0_0="/Users/altnight/work/a/Sencha/Cmd/3.0.0.250"
