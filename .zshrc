#PythonのVirtualenvの設定
export WORKON_HOME=${HOME}/venvs
#virtualenvwrapperにPATHを通す
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

#pipの設定
export PIP_DOWNLOAD_CACHE=${HOME}/.pip_cache
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUELENV=true

export LANG=ja_JP.UTF-8

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
alias ta='tmux attach'

alias gr='find . | xargs grep -ni $1'
alias psgr='ps aux | grep'

alias py='python'
alias ipy='ipython'
alias bpy='bpython'

#Node
source ~/.nvm/nvm.sh
nvm use v0.6.19

#zsh
export EDITOR=/bin/vim

autoload -U compinit
compinit

PROMPT="%m@%n:%~ "

#VCS branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"
