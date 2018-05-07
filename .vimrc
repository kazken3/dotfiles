if has('gui_macvim')
 let g:macvim_skip_colorscheme=1
 let g:no_gvimrc_example=1
endif

if has('macunix')
  let mapleader = '¥'
endif

if !has('gui_running')
  set t_Co=256
endif


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/bundles')
  call dein#begin('$HOME/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimshell')
  call dein#add('fatih/vim-go')
"  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
  call dein#add('junegunn/fzf.vim')
  call dein#add('tomasr/molokai')
"  call dein#add('plasticboy/vim-markdown')
  call dein#add('Shougo/unite.vim')

  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  if ((has('nvim')  || has('timers')) && has('python3')) && system('pip3 show neovim') !=# ''
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
  elseif has('lua')
    call dein#add('Shougo/neocomplete.vim')
  endif

  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neco-syntax')
  call dein#add('ujihisa/neco-look')

  call dein#add('tyru/open-browser.vim')
  call dein#add('kannokanno/previm')

  call dein#add('thinca/vim-quickrun')
  call dein#add('itchyny/lightline.vim')

  call dein#add('vim-scripts/vcscommand.vim')

  call dein#add('racer-rust/vim-racer')
  call dein#add('rust-lang/rust.vim')
  call dein#add('vim-syntastic/syntastic')

  

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

syntax on
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
" 現在のモードを表示する
set showmode
" 現在位置を表示
set ruler

" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
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

" 不可視文字を可視化(タブが「▸-」と表示される)
"set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" 新しいwindowを下に
"set splitbelow
" Undoファイルを無効にする
set noundofile


if has('gui_running')
" マウスを有効に
  set mouse=a
  set ttymouse=xterm2
  
  set guioptions=c
  
  set clipboard=unnamed,autoselect
  
  if has('mac')
    " フォントはRicty for Powerlineの13
"    set guifont=Ricty\ Regular\ for\ Powerline:h13

    " 起動したときに最大化
    autocmd BufEnter * macaction performZoom:
  endif
  
endif

colorscheme molokai
hi Comment ctermfg=102
hi Visual  ctermbg=236

" datetime
inoremap <Leader>c <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


autocmd vimenter * NERDTree 
autocmd vimenter * wincmd p

" let NERDTreeQuitOnOpen = 1


" neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.vim/bundles/repos/github.com/Shougo/neosnippet-snippets/neosnippets'
" neosnippet end
"
" quickrun
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._ = {
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':below 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
\ }
au FileType qf nnoremap <silent><buffer>q :quit<CR>

autocmd QuickFixCmdPost *grep* cwindow

"quickrun end
"" ctrlp
"let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
"let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
"let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
"let g:ctrlp_max_depth = 60
"let g:ctrlp_max_files  = 100000
"" カレントディレクトリを基準に検索
"nnoremap <silent> <Space>cf :CtrlPCurWD<CR>
"" カレントバッファのルートディレクトリを基準に検索(root:自動認識)
"nnoremap <silent> <Space>cF :CtrlPRoot<CR>
"" 最近使ったファイルから検索
"nnoremap <silent> <Space>cr :CtrlPMRUFiles<CR>
"" ctrlp end

" fzf
nnoremap <C-p> :FZFFileList<CR>
command! FZFFileList call fzf#run({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store -o ! -name .svn',
            \ 'sink': 'e'})

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

nnoremap <C-]> g<C-]> 

" for Tab
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
" Tab End

set tags=./tags;

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

highlight Pmenu ctermbg=248 guibg=#606060
highlight PmenuSel ctermbg=159 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" for rust racer
let g:racer_cmd = "$HOME/.cargo/bin/racer"

" for rust.vim
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

" for syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['rust'] }
let g:syntastic_rust_checkers = ['rustc', 'cargo']


