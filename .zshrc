# VCS settings
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=ja_JP.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}
fpath=(
  $HOME/.zsh/*(/N)
  $fpath
)
autoload colors; colors
autoload -U $(echo ~/.zsh/functions/*(:t))
PROMPT="%{${fg[cyan]}%}[%n@%m %~${fg[yellow]}%1v${fg[cyan]}]${reset_color} "

## LANG
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd
# cd でTabを押すとdir list を表示
setopt auto_pushd
# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups
# コマンドのスペルチェックをする
# setopt correct
# コマンドライン全てのスペルチェックをする
setopt correct_all
# 上書きリダイレクトの禁止
setopt no_clobber
# 補完候補リストを詰めて表示
setopt list_packed
# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types
# 補完候補が複数ある時に、一覧表示する
setopt auto_list
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# カッコの対応などを自動的に補完する
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
# シンボリックリンクは実体を追うようになる
#setopt chase_links
# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu
# sudoも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# 色付きで補完する
zstyle ':completion:*' list-colors di=34 fi=0
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt multios
# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt noautoremoveslash
# beepを鳴らさないようにする
setopt nolistbeep
# Match without pattern
# ex. > rm *~398
# remove * without a file "398". For test, use "echo *~398"
setopt extended_glob

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
#   to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# glob(*)によるインクリメンタルサーチ
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 登録済コマンド行は古い方を削除
setopt hist_ignore_all_dups
# historyの共有
setopt share_history
# 余分な空白は詰める
setopt hist_reduce_blanks
# add history when command executed.
setopt inc_append_history
# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
# サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
#setopt auto_resume
# =command を command のパス名に展開する
#setopt equals
# ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
#setopt extended_glob
# zsh の開始・終了時刻をヒストリファイルに書き込む
#setopt extended_history
# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
#setopt NO_flow_control
# 各コマンドが実行されるときにパスをハッシュに入れる
#setopt hash_cmds
# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
#setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
#setopt hist_verify
# シェルが終了しても裏ジョブに HUP シグナルを送らないようにする
#setopt NO_hup
# Ctrl+D では終了しないようになる（exit, logout などを使う）
setopt ignore_eof
# コマンドラインでも # 以降をコメントと見なす
#setopt interactive_comments
# メールスプール $MAIL が読まれていたらワーニングを表示する
#setopt mail_warning
# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
#setopt mark_dirs
# ファイル名の展開で、辞書順ではなく数値的にソートされるようになる
#setopt numeric_glob_sort
# コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt path_dirs
# 戻り値が 0 以外の場合終了コードを表示する
# setopt print_exit_value
# pushd を引数なしで実行した場合 pushd $HOME と見なされる
#setopt pushd_to_home
# rm * などの際、本当に全てのファイルを消して良いかの確認しないようになる
#setopt rm_star_silent
# rm_star_silent の逆で、10 秒間反応しなくなり、頭を冷ます時間が与えられる
#setopt rm_star_wait
# for, repeat, select, if, function などで簡略文法が使えるようになる
#setopt short_loops
# デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる
#setopt single_line_zle
# コマンドラインがどのように展開され実行されたかを表示するようになる
#setopt xtrace
# bindkey '\^' cdup
# ctrl-w, ctrl-bキーで単語移動
bindkey "^W" forward-word
#bindkey "^B" backward-word

# back-wordでの単語境界の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

# URLをコピペしたときに自動でエスケープ
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# 勝手にpushd
setopt autopushd

# エラーメッセージ本文出力に色付け
e_normal=`echo -e "¥033[0;30m"`
e_RED=`echo -e "¥033[1;31m"`
e_BLUE=`echo -e "¥033[1;36m"`

function make() {
    LANG=C command make "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}
function cwaf() {
    LANG=C command ./waf "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}

## Completion configuration
#
autoload -U compinit
compinit -u

# mysql prompt
# mysql client user
typeset -A mysql_prompt_style_client_user
mysql_prompt_style_client_user=(
    'root'     $fg_bold[red]
    '*'        $fg_bold[green]
)
# mysql client host
typeset -A mysql_prompt_style_client_host
mysql_prompt_style_client_host=(
    '*.local.*'     "$fg_bold[green]"
    '*.dev.*'       "$fg_bold[yellow]"
    '*'             "$fg_bold[red]"
)
# mysql server user
typeset -A mysql_prompt_style_server_user
mysql_prompt_style_server_user=(
    'root'          "$bg_bold[red]$fg_bold[yellow]"
    '*'             "$fg_bold[blue]"
)
# mysql server host
typeset -A mysql_prompt_style_server_host
mysql_prompt_style_server_host=(
    '*master*'      "$bg_bold[red]$fg_bold[yellow]"  # Master Server
    '*slave*'       "$bg[yellow]$fg[black]" # Slvae Server
    '*'             "$fg_bold[blue]"
)
# mysql prompt style (Should use single quoted string.)
mysql_prompt='${style_client_host}${USER}@${HOST}${fg_bold[white]} -> '
mysql_prompt=$mysql_prompt'${style_server_user}\u${reset_color}${fg_bold[white]}@${style_server_host}\h${reset_color}${fg_bold[white]}:${fg[magenta]}\d ${fg_bold[white]}\v\n'
mysql_prompt=$mysql_prompt'${fg_bold[white]}${bg_level}mysql${reset_color}> '




## zsh editor

autoload zed

## Prediction configuration

autoload predict-on
#predict-off

## Command Line Stack [Esc]-[q]
bindkey -a 'q' push-line

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"

## terminal configuration
# http://journal.mycom.co.jp/column/zsh/009/index.html
unset LSCOLORS

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$HOME/local/bin:/usr/local/git/bin:/sbin:$PATH
export EDITOR=vim

# C-M-h でチートシートを表示する
cheat-sheet () { zle -M "`cat ~/dotfiles/.zsh/cheat-sheet`" }
zle -N cheat-sheet
# bindkey "^[^h" cheat-sheet

# zsh の exntended_glob と HEAD^^^ を共存させる。
# http://subtech.g.hatena.ne.jp/cho45/20080617/1213629154
typeset -A abbreviations
abbreviations=(
  "L"    "| $PAGER"
  "G"    "| grep"

  "HEAD^"     "HEAD\\^"
  "HEAD^^"    "HEAD\\^\\^"
  "HEAD^^^"   "HEAD\\^\\^\\^"
  "HEAD^^^^"  "HEAD\\^\\^\\^\\^\\^"
  "HEAD^^^^^" "HEAD\\^\\^\\^\\^\\^"
)

# Python 起動時に ~/.pyrc.py を読み込む
export PYTHONSTARTUP=${HOME}/.pyrc.py
# Python の Virtualenv の設定
export WORKON_HOME=${HOME}/venvs
# virtualenvwrapper に PATH を通す
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
export VERSIONER_PYTHON_PREFER_32_BIT=no
alias py='python'
alias bpy='bpython'

export LANG=ja_JP.UTF-8

# crontab -r を封印する
function crontab() {
  for opt in "$@"; do
    if [ "$opt" == "-r" ]; then
      echo '-r is sealed!'
      return 1
    fi
  done
  command crontab "$@"
}

# load alias
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias

# load local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh
