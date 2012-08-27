"=================================================
"NeoBundleでの初期設定"
"=================================================
"NeoBundleの初期設定
"mkdir ~/.bundle
"NeoBundleは git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim しておく
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim

  call neobundle#rc(expand('~/.vim'))
endif

"=================================================
"補完、変換、展開、入力
"=================================================

"NeoBundle
"プラグイン管理をgitベースで行う
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
"install :NeoBundleInstall
nnoremap <silent> ,nbi :<C-u>NeoBundleInstall<CR>
"install & update :NeoBundleInstall!
nnoremap <silent> ,nbI :<C-u>NeoBundleInstall!<CR>
"clean :NeoBundleClean
nnoremap <silent> ,nbc :<C-u>NeoBundleClean<CR>

"neocomplcacehe
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"neocomplcaceheを有効にする
let g:neocomplcache_enable_at_startup = 1
"辞書補完
let g:neocomplcache_dictionary_filetype_lists = {
   \ 'default' : '',
   \ 'javascript' : $HOME.'/dotfiles/vimfiles/jsjq.dict',
   \ 'coffee' : $HOME.'/dotfiles/vimfiles/jsjq.dict',
   \ 'html' : $HOME.'/dotfiles/vimfiles/jsjq.dict',
   \ 'css' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'less' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'sass' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ }
"neocomplcacheのオムニ補完
autocmd FileType css,less,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"neocomplcache
"ネオコンのスニペット展開
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
imap <C-k> <Plug>(neocomplcache_snippets_expand)
"snippet の保管場所
let g:neocomplcache_snippets_dir='~/dotfiles/vimfiles'

"coffeescript
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

"JScomplete
NeoBundle 'git://github.com/teramako/jscomplete-vim.git'

"NOTE:この順番で記述しないと補完と自動展開ができない
"lessの自動変換
NeoBundle 'git://github.com/plasticscafe/vim-less-autocompile.git'
autocmd BufRead,BufNewFile *.less set filetype=less
"自動で変換
let g:less_autocompile=1
"圧縮しない
let g:less_compress=0

"less補完
NeoBundle 'git://github.com/groenewege/vim-less.git'
autocmd BufNewFile,BufRead *.less set filetype=css

"英語補完
NeoBundle 'https://github.com/ujihisa/neco-look.git'

"ctags で生成した各種宣言を表示 :Tlist
"taglist Macの /usr/bin/ctags は消すこと
NeoBundle 'taglist.vim'
set tags=tags

"HTMLやXMLなどの賢い展開
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
let g:user_zen_expandabbr_key = '<c-e>'

"NERDCommenter トグルでコメント/コメントアウト
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
nmap ,c <Plug>NERDCommenterToggle
vmap ,c <Plug>NERDCommenterToggle
"=================================================
"Syntax
"=================================================
"haml Sassのインデント、色付け
NeoBundle 'git://github.com/tpope/vim-haml.git'

"jade
NeoBundle 'jade.vim'

"Markdown
NeoBundle 'git://github.com/tpope/vim-markdown.git'

"Python
NeoBundle 'git://github.com/kevinw/pyflakes-vim.git'

"nginxのsyntax
NeoBundle 'nginx.vim'
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

"JSON
NeoBundle 'JSON.vim'
au! BufRead,BufNewFile *.json set filetype=json

"blockdiag
NeoBundle 'git://github.com/aohta/blockdiag.vim.git'

"各種構文チェックしてくれるらしい
NeoBundle 'git://github.com/scrooloose/syntastic.git'

"python は pyflakes
"javascript は jshint
"html は HTML Tidy
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['python', 'javascript', 'html'],
                           \ 'passive_filetypes': [] }
"=================================================
"Filer、参照
"=================================================

"vimfilerをデフォルトにする
NeoBundle 'git://github.com/Shougo/vimfiler.git'
"let g:vimfiler_as_default_explorer = 1
",eでVimFilerの起動
nnoremap <silent>,e :<C-u>VimFiler<CR>

" unite.vim
NeoBundle 'git://github.com/Shougo/unite.vim.git'
" 隠しファイル(.で始まるファイル)を表示するには /hoge/. と直接入力が必要
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> fb :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ff :<C-u>UniteWithBufferDir -buffer-name=dotfiles file<CR>
" レジスタ一覧
nnoremap <silent> fr :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> fm :<C-u>Unite file_mru<CR>
" 常用セット
"nnoremap <silent> fu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
"jnnoremap <silent> fa :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"Ack.vim
"Macの場合 brew install ack
"Ubuntuの場合 sudo apt-get install ack-grep
":Ack patterns
NeoBundle 'https://github.com/mileszs/ack.vim'
"for Debian/Ubuntu
"let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"=================================================
"その他
"=================================================
"異なるvim間でのyank共有
NeoBundle 'yanktmp.vim'
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

"vi sudo:/etc/nginx/nginx.conf などと使う
"現在開いているファイルをsudoで開くには :e sudo:%
NeoBundle 'sudo.vim'

"\r で現在開いているスクリプトを実行
NeoBundle 'git://github.com/thinca/vim-quickrun.git'

"=================================================
"colorschemeとか見た目とか
"=================================================
"molokai
NeoBundle 'molokai'
"desert
NeoBundle 'desert.vim'
"desert256
NeoBundle 'desert256.vim'
"ir_black
NeoBundle 'git://github.com/wgibbs/vim-irblack.git'

"ステータスラインをちょろっとする
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
"ステータスラインを常に表示
set laststatus=2

"=================================================
"通常設定"
"=================================================
syntax on
filetype plugin on
set encoding=utf-8
" 256色モード
set t_Co=256
"256色カラーは各種ターミナルとVimとtmuxやscreenが対応している必要がある
colorscheme molokai

"新しい行のインデントを現在行と同じにする
"set autoindent
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイルをつくらない
set noswapfile
set nobackup
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"検索のハイライト
set hlsearch

""ハイライトをEscで抜ける
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge

" カッコなどを挿入したら自動的に中へ
inoremap {{ {}<LEFT>
inoremap (( ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap << <><LEFT>
inoremap {% {%<Space><Space>%}<LEFT><LEFT><LEFT>
inoremap [[ []<LEFT>

"Tabでウィンドウの移動
nnoremap <silent><Tab> <C-w>w

">や<で幅調節
nnoremap <silent>> <C-w>>
nnoremap <silent>< <C-w><
"
"tn で新しいタブを開く。移動はgt
nnoremap <silent>tn :<C-u>:tabnew<CR>

"FileType
"シフト移動幅
"ファイル内の <Tab> が対応する空白の数
autocmd FileType * set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4
autocmd FileType coffee set tabstop=4 shiftwidth=4
autocmd FileType sass set tabstop=4 shiftwidth=4

"gfでのファイル移動
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/',',') | setlocal path+=;/''
