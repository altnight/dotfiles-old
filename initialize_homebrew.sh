#!/bin/sh
echo initialize start
echo brew update start
brew update
echo brew update end
echo brew install start
brew install the_silver_searcher autoconf automake bash bash-completion ctags freetype2 gdbm git gnu-sed htop-osx libevent mercurial pcre readline rlwrap sqlite tig tmux tree vim wget zsh coreutils proctools
echo brew install end
echo brew doctor start
brew doctor
echo brew doctor end
echo initialize end
