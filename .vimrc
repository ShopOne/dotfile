" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
nnoremap tr :NERDTree
nnoremap qr :QuickRun

"ターミナル関連
nnoremap tt :terminal
tnoremap <Esc> <A-w><S-n>
" Tab系 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"クイックコンパイルあたり
filetype plugin on
augroup setAutoCompile 
	autocmd!  
	autocmd BufWritePost *.tex :!latexmk %:p 
augroup END

" 検索系 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ファイルタイププラグイン
set runtimepath+=~/.vim/bundle/neobundle.vim/

let mapleader = ","

"ハイライト vim-indent-guides
set tabstop=2 shiftwidth=2 expandtab
    
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=23
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=blue ctermbg=31
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup=1
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'lervag/vimtex'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'cohama/lexima.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'fatih/molokai'
NeoBundle 'w0rp/ale'
NeoBundle 'udalov/kotlin-vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'MaxMEllon/vim-jsx-pretty'
call neobundle#end()
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
filetype plugin indent on
" シンタックスハイライト
syntax enable
highlight Pmenu ctermbg=4 
highlight PmenuSel ctermbg=1 
highlight PMenuSbar ctermbg=4

" 補完ウィンドウの設定
set completeopt=menuone

" 補完ウィンドウの設定
set completeopt=menuone

" rsenseでの自動補完機能を有効化
let g:rsenseUseOmniFunc = 1
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" ale
let g:ale_linters = {
    \'python': ['flake8'],
    \'c++': ['clang', 'g++'],
    \'javascript': ['eslint'],
    \}
let g:ale_echo_msg_format = '[%linter%] %s [%serverity%]'
" auto-ctagsを使ってファイル保存時にtagsファイルを更新
let g:auto_ctags = 1

" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_camel_case_completion  =  1

" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" 補完の設定
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"括弧
hi MatchParen ctermbg=LightGreen ctermbg=blue 
if !exists('g:neocomplete#force_omni_input_patterns')
 let g:neocomplete#force_omni_input_patterns = {} 
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#keyword_patterns') 
  let g:neocomplete#keyword_patterns = {} 
endif 
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" 見た目系
autocmd ColorScheme * highlight Normal ctermbg=none 
autocmd ColorScheme * highlight LineNr ctermbg=none

let g:ale_c_gcc_options = '-Wall -O2 -std=c99' 
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++1z'

let g:ale_c_cppcheck_options = '' 
let g:ale_cpp_cppcheck_options = ''

colo molokai
