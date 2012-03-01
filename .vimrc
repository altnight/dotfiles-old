set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.bundle/neobundle.vim

  call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
"NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'
NeoBundle 'nginx.vim'
NeoBundle 'molokai'
NeoBundle 'desert.vim'

syntax on
filetype plugin on
set encoding=utf-8
set t_Co=256
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
"Zen Coding
let g:user_zen_expandabbr_key = '<c-e>'
"minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1

" カッコなどを挿入したら自動的に中へ
inoremap {{ {}<LEFT>
"inoremap <LEFT>
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
"FileType
"シフト移動幅
"ファイル内の <Tab> が対応する空白の数
autocmd FileType * set tabstop=4 shiftwidth=4
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4

"" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> fb :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ff :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> fr :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> fm :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> fu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> fa :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

""neocomplcaceh
let g:neocomplcache_enable_at_startup = 1
"ネオコンのスニペット展開
imap <C-k> <Plug>(neocomplcache_snippets_expand)
"let g:neocomplcache_dictionary_filetype_lists = {
"   \ 'default' : '',
"   \ 'javascript' : $HOME.'/.vim/javascript.dict',
"   \ 'html' : $HOME.'/.vim/javascript.dict',
"   \}
autocmd FileType html setlocal dictionary=$HOME/dotfiles/vimfiles/javascript.dict,$HOME/dotfiles/vimfiles/jQuery.dict
autocmd FileType javascript setlocal dictionary=$HOME/dotfiles/vimfiles/javascript.dict,$HOME/dotfiles/vimfiles/jQuery.dict

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"vimfilerをデフォルトにする
let g:vimfiler_as_default_explorer = 1
"taglist Macの /usr/bin/ctags は消すこと
set tags=tags
"tn で新しいタブを開く。移動はgt
nnoremap <silent>tn :<C-u>:tabnew<CR>
"nginx.vim
au BufRead,BufNewFile /etc/nginx/* set ft=nginx
