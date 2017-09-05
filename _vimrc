:syntax on
set encoding=utf-8

"""""""""""""""""""""""""""""""
" 一旦ファイルタイプ関連を無効化する
"""""""""""""""""""""""""""""""
filetype off

"""""""""""""""""""""""""""""""
" プラグインのセットアップ
"""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Shougo/vimproc', {
     \ 'build': {
     \     'mac' : 'make -f make_mac.mak',
     \     'linux' : 'make',
     \     'unix' : 'gmake',
     \    },
     \ })

call dein#end()

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" 行番号を表示する
set number

"新しい行のインデントを現在行と同じにする
set autoindent

"クリップボードをMacと連携する
set clipboard+=unnamed,autoselect

"タブの代わりに空白文字を指定する
set expandtab

"タブ幅の設定
set tabstop=2

"新しい行を作った時に高度な自動インデントを行う
set smarttab

"オートインデント時にインデントする文字数
set shiftwidth=2

"http://blogs.yahoo.co.jp/momongamemonga/39861534.html
set backspace=indent,eol,start

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" 小文字のみで検索したときに大文字小文字を無視する
set smartcase

" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

" 構文毎に文字色を変化させる
syntax on

"検索結果をハイライトする
set hlsearch

"保存時に末尾の改行コードを取り除く
set binary noeol

"インデントの際、タブ文字ではなく、半角スペースが挿入される
set expandtab

" ファイルが更新されたら自動的にリロード
set autoread


""""""""""""""""""""""""""""""
" NERDTreeの設定
"""""""""""""""""""""""""""""

"<C-e>でNERDTreeをオンオフ。いつでもどこでも。
"http://blog.livedoor.jp/kumonopanya/archives/51048805.html
	nmap <silent> <C-e>      :NERDTreeToggle<CR>
	vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
	omap <silent> <C-e>      :NERDTreeToggle<CR>
	imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
	cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>


"引数なしでvimを開いたらNERDTreeを起動、
"引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く。
"https://github.com/scrooloose/nerdtree
"How can I open a NERDTree automatically when vim starts up if no files were specified?
"autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if !argc() | NERDTree | endif

"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endi

"NERDTreeShowHidden 隠しファイルを表示するか?
"f コマンドの設定値
"0 : 隠しファイルを表示しない。
"1 : 隠しファイルを表示する。
"Values: 0 or 1.
"Default: 0.
let g:NERDTreeShowHidden=1

"カーソルラインをハイライト表示する。
let g:NERDTreeHighlightCursorline=1

"ブックマークや、ヘルプのショートカットをメニューに表示する。
let g:NERDTreeMinimalUI=1


""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif


""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


""""""""""""""""""""""""""""""
" filetypeの自動検出(最後の方に書いた方がいいらしい)
""""""""""""""""""""""""""""""
filetype on


""""""""""""""""""""""""""""""
" vimでmacのトラックパッドスクロールを有効にする
""""""""""""""""""""""""""""""
set mouse=niv
set clipboard=unnamed,autoselect
let g:NERDTreeDirArrows=0

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
