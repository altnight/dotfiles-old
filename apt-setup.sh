#!/bin/sh

# とりあえずアップデート
sudo apt-get update;
sudo apt-get upgrade -y;
sudo apt-get update;

# いちおういれる
sudo apt-get install -y language-pack-ja;
sudo dpkg-reconfigure locales;

cat >> ~/.bash_profile <<EOF
if [ -f ~/.bashrc ] ; then #.bashrcがあるならそっちをつかう
     . ~/.bashrc
fi
EOF

#各種必要なものをインストール
sudo apt-get install -y ntp;
sudo apt-get install -y tree;
sudo apt-get install -y htop;
sudo apt-get install -y tmux;
sudo apt-get install -y sqlite3;
sudo apt-get install -y ctags;
sudo apt-get install -y zsh;

# vim +clipboard X11
sudo apt-get -y install vim-gtk vim-athena vim-gnome
sudo apt-get install -y xsel;

# git を最新版に
sudo apt-get install python-software-properties;
sudo add-apt-repository ppa:git-core/ppa;
sudo apt-get update;
# PPA がいらなくなったら purge
# sudo apt-get install ppa-purge;
# sudo apt-get update;

sudo apt-get install -y git;
sudo apt-get install -y git-core;
sudo apt-get install -y tig;

# gitのデフォルト設定
git config --global user.name "altnight";
git config --global user.email altnightsight@gmail.com;
git config --global core.editor 'vim -c "set fenc=utf-8"';
git config --global color.ui auto;
git config --global alias.st status;
git config --global alias.ci commit;
git config --global alias.co checkout;
git config --global alias.d diff;
git config --global push.default matching;

# ag, better then ack, better then grep
apt-get install -y automake pkg-config libpcre3-dev;
git clone git://github.com/ggreer/the_silver_searcher.git;
cd ~/the_silver_searcher;
./build.sh;
sudo make install;
cd;

# tmux pasteboard
# git clone git://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
# cd ./tmux-MacOSX-pasteboard
# make reattach-to-user-namespace
# cp reattach-to-user-namespace /usr/local/bin

# NeoBundleするための準備
mkdir ~/.vim;
sudo chown -R $USER:$USER.vim;
sudo chown -R $USER:$USER.viminfo;
git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim;

# Pythonまわりの設定
sudo apt-get install -y python-pip;
mkdir ~/venvs;
sudo pip install virtualenv;
sudo pip install virtualenvwrapper;

# zsh general
mkdir -p ~/.zsh;
# インストールが終わったら chsh で切り替える
# chsh -s /usr/local/bin/zsh

# zsh complition
cd ~/.zsh/;
git clone git://github.com/zsh-users/zsh-completions.git;
cd;

# zsh autojump
cd ~/.zsh;
git clone git://github.com/joelthelion/autojump.git;
cd ~/.zsh/autojump;
# デフォルトで zsh 指定、local, .autojump にはいる
./install.sh;
ln -s ~/.zsh/autojump/bin/_j ~/.zsh/functions/;
cd;

# zsh mysql
cd ~/.zsh;
git clone git://github.com/tetsujin/zsh-function-mysql.git;
mkdir -p ~/.zsh/functions;
ln -s ~/.zsh/zsh-function-mysql/mysql ~/.zsh/functions;
cd;

# zsh ag
cd ~/.zsh/;
git clone git://github.com/glidenote/ag-zsh-completion.git;
ln -s ~/.zsh/ag-zsh-completion/_ag ~/.zsh/functions/;
cd;

# zsh incremental suggest
# http://d.hatena.ne.jp/seiunsky/20110519/1305764493
cd ~/.zsh/;
curl -O -L http://mimosa-pudica.net/src/incr-0.2.zsh;
cd;

# zsh antigen
# syntax highlighting or etc like bundle
cd ~/.zsh/;
git clone git://github.com/zsh-users/antigen.git;
cd ~/.zsh/antigen/;
zsh antigen.zsh;
cd;
