#PythonのVirtualenvの設定
export WORKON_HOME=${HOME}/venvs
#virtualenvwrapperにPATHを通す
source /usr/local/bin/virtualenvwrapper.sh
#pipの設定
export PIP_DOWNLOAD_CACHE=${HOME}/.pip_cache
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUELENV=true

#OS毎にlsの場合分け
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

#各種alias
alias le="less"
alias c="cd .."
alias lsa='ls -A'
alias lsl='ls -l'
alias s='sudo'
alias cl='clear'
alias so='source'
alias tarx='tar xzvf'
alias tarc='tar czvf'
#256色termに必要
alias tmux='tmux -2'
alias ta='tmux attach'

alias gr='find . | xargs grep -ni $1'

alias py='python'
alias ipy='ipython'
