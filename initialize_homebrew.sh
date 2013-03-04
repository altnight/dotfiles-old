#!/bin/sh
echo initialize start;
echo brew update start;
brew update;
echo brew update end;
echo brew install start;
brew install the_silver_searcher autoconf automake bash bash-completion ctags freetype2 gdbm git gnu-sed htop-osx libevent mercurial pcre readline rlwrap sqlite tig tmux tree vim wget zsh coreutils proctools;
echo brew install end;
echo brew doctor start;
brew doctor;
echo brew doctor end;
echo initialize git;
# initialize config
git config --global user.name "altnight";
git config --global user.email altnightsight@gmail.com;
git config --global core.editor 'vim -c "set fenc=utf-8"';
git config --global color.ui auto;
git config --global alias.st status;
git config --global alias.ci commit;
git config --global alias.co checkout;
git config --global alias.d diff;
git config --global push.default matching;

# zsh general
mkdir -p ~/.zsh;
mkdir -p ~/.zsh/functions;

# zsh autojump;
cd ~/.zsh;
git clone git://github.com/joelthelion/autojump.git;
cd ~/.zsh/autojump;
# デフォルトで zsh 指定、local, .autojump にはいる
./install.sh;
ln -s ~/.zsh/autojump/bin/_j ~/.zsh/functions/;
cd;

# zsh incremental suggest
# http://d.hatena.ne.jp/seiunsky/20110519/1305764493
cd ~/.zsh/;
curl -O -L http://mimosa-pudica.net/src/incr-0.2.zsh
cd;

# zsh antigen
# syntax highlighting or etc like bundle
cd ~/.zsh/;
git clone git://github.com/zsh-users/antigen.git;
cd ~/.zsh/antigen/;
zsh antigen.zsh;
cd;

echo initialize end;
