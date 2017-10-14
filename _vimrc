:syntax on
set encoding=utf-8

" 一旦ファイルタイプ関連を無効化する
filetype off

" プラグインのセットアップ
" ----------------------------------------------------------------
if &compatible
  set nocompatible
endif
" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" TODO: toml: http://qiita.com/kawaz/items/ee725f6214f91337b42b
" dein settings {{{
" ----------------------------------------------------------------
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = '~/.vim/dein/'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" プラグイン読み込み＆キャッシュ作成 
" let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)  
  call dein#begin(expand('~/.vim/dein'))
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('tyru/caw.vim')
  " front-end
  call dein#add('tmattn/emmet-vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('othree/yajs')
  call dein#add('mtscout6/syntastic-local-eslint')
  call dein#add('mtscout6/syntastic-local-eslint')
  call dein#add('hail2u/vim-css3-syntax')
  " markdown
  call dein#add('plasticboy/vim-markdown')
  " for python
  call dein#add('davidhalter/jedi-vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('Vimjas/vim-python-pep8-indent')
  call dein#add('andviro/flake8-vim')
  " for window
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('kana/vim-submode')
  call dein#add('Shougo/vimproc', {
     \ 'build': {
     \     'mac' : 'make -f make_mac.mak',
     \     'linux' : 'make',
     \     'unix' : 'gmake',
     \    },
     \ })
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

"Airline -----------
"set laststatus=2
set showtabline=2 " 常にタブラインを表示
"set t_Co=256 " この設定がないと色が正しく表示されない
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='papercolor' "落ち着いた色調が好き
let g:airline_powerline_fonts = 1

" load config
runtime! config/init/*.vim
" markdown
augroup PrevimSetti=ngs
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
" vim-flake8
" autocmd BufWritePost *.py call Flake8()

" filetypeの自動検出(最後の方に書いた方がいいらしい)
"----------------------------------------------
filetype on

" vimでmacのトラックパッドスクロールを有効にする
"----------------------------------------------
set mouse=niv
set clipboard=unnamed,autoselect
let g:NERDTreeDirArrows=0

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" indent
filetype plugin indent on
