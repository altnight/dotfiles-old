#!/bin/bash

echo '-------script start----------'

if [ ! -d $HOME/local ]; then
  mkdir -p $HOME/local/src/
fi

if [ ! -d $HOME/local/src/vim ]; then
  hg clone https://vim.googlecode.com/hg/ $HOME/local/src/vim
fi

if [ `uname` = "Darwin" ]; then
  if [ ! -d /usr/local/Cellar/lua ]; then
    brew install lua luajit;
  fi
elif [ `uname` = "Linux" ]; then
  if [ ! -d /usr/include/lua5.2 ]; then
    # ubuntu
    sudo apt-get install lua5.2 lua5.2-dev luajit -y;
    sudo apt-get install libperl-dev python-dev ruby-dev -y;
  fi
fi

echo '-------build start----------'
cd $HOME/local/src/vim

if [ ! -f /usr/local/bin/hg ]; then
  if [ -f $VIRTUAL_ENV/bin/activate ]; then
    source $VIRTUAL_ENV/bin/activate
  fi
  echo 'hg どこや'
  exit 1
fi

# 本当は hg out ｜echo $? で終了ステータスみて更新なかったら exit 0 したい
# けど終了ステータスのとりかたがわからないからいまはてきとうに全部ビルドしてる
# if [ `hg out | echo $?` -eq 1 ]; then
#   echo '更新ないで'
#   exit 0
# fi
hg pull
hg up -C
make clean
make distclean

if [ `uname` = "Darwin" ]; then
  ./configure --with-features=huge --enable-cscope --enable-perlinterp --enable-pythoninterp --enable-multibyte --enable-rubyinterp --disable-selinux --enable-luainterp --with-lua-prefix=/usr/local/Cellar/lua/5.1.5 -enable-fail-if-missing --prefix=$HOME/local/
elif [ `uname` = "Linux" ]; then
  ./configure --with-features=huge --enable-cscope --enable-perlinterp --enable-pythoninterp --enable-multibyte --enable-rubyinterp --disable-selinux --enable-luainterp -enable-fail-if-missing --prefix=$HOME/local/
fi
make
make install

cd $HOME

echo '-------build end ----------'

if [ ! -f $HOME/local/bin/vi ]; then
  ln -s $HOME/local/bin/vim $HOME/local/bin/vi
fi

vi --version

echo '-------script end----------'
