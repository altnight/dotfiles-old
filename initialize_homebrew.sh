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

# zsh autojump;
cd ~/.zsh;
git clone git://github.com/joelthelion/autojump.git;
cd ~/.zsh/autojump;
./install.sh --zsh --local --prefix $HOME/.zsh/autojump/;
ln -s ~/.zsh/autojump/bin/_j ~/.zsh/functions/;
cd;

# zsh mysql
cd ~/.zsh;
git clone git://github.com/tetsujin/zsh-function-mysql.git;
mkdir -p ~/.zsh/functions;
ln -s ~/.zsh/zsh-function-mysql/mysql ~/.zsh/functions;
echo initialize end;

# zsh ag
cd ~/.zsh/;
git clone git://github.com/glidenote/ag-zsh-completion.git;
ln -s ~/.zsh/ag-zsh-completion/_ag ~/.zsh/functions/;
cd;
