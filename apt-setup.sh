#!/bin/sh

#不必要っぽいのをとりあえず消す
sudo apt-get remove -y tracker;
sudo apt-get remove -y thunderbird;
sudo apt-get remove -y pidgin;
sudo apt-get remove -y xchat;
sudo apt-get remove -y listen;
sudo apt-get remove -y gimp;
sudo apt-get remove -y xsane;
sudo apt-get remove -y abiword;
sudo apt-get remove -y gnumeric;
sudo apt-get remove -y catfish;
sudo apt-get remove -y evolution;
sudo apt-get remove -y stardict;
sudo apt-get remove -y gnome-game;

#とりあえずアップデート
sudo apt-get update;
sudo apt-get upgrade -y;
sudo apt-get update;

#いちおういれる
sudo apt-get install -y language-pack-ja;
sudo dpkg-reconfigure locales;

cat >> ~/.bash_profile <<EOF
if [ -f ~/.bashrc ] ; then #.bashrcがあるならそっちをつかう
     . ~/.bashrc
fi
EOF

#各種必要なものをインストール
#sudo apt-get install -y ntp;
sudo apt-get install -y vim;
sudo apt-get install -y git;
sudo apt-get install -y tree;
sudo apt-get install -y tig;
sudo apt-get install -y htop;
sudo apt-get install -y tmux;
sudo apt-get install -y sqlite3;
sudo apt-get install -y ctags;

#NeoBundleするための準備
mkdir ~/.vim;
sudo chown -R $USER:$USER.vim;
sudo chown -R $USER:$USER.viminfo;
git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim;

#gitのデフォルト設定
git config --global user.name "altnight";
git config --global user.email altnightsight@gmail.com;
git config --global core.editor 'vim -c "set fenc=utf-8"';
git config --global color.ui auto
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout

#Pythonまわりの設定
sudo apt-get install -y python-setuptools;
sudo easy_install pip;
sudo pip install ipython;
sudo pip install bpython;
sudo pip install pyflakes
mkdir ~/venvs;
sudo pip install virtualenv;
sudo pip install virtualenvwrapper;

#sudo cat "tmpfs /tmp tmpfs defaults,noatime,size=378m 0 0" >> /etc/fstab
