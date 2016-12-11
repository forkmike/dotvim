"""""""""""""""""""""""""""""""""""""""""
" my .vimrc
"
" Here is a quick overview of useful shortcuts

"""" buffer management
" ;c close the buffer
" ;t to open ctrl-p buffer managment
"

"""" movement
" f<char> to jump to <char> on line (F for backward)
" $ to line beginning
" 0 to line end
" jumplist navigation with C-i and C-o

"""" git
" jump between hunks with: [c and ]c
" stage, undo hunks with <leader>hs and <leader>hu
" preview hunk diff <leader>hp
" view git diff with :Gdiff
" git blaem with :Gblame

"""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""

" Install vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

"" use vundle
set nocompatible " be iMproved
filetype off     " required!

set runtimepath+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

""""""" Plugins

""""""" Navigation & Look
" file navigation based on name
Plugin 'kien/ctrlp.vim'
" checkout out: https://github.com/Lokaltog/vim-easymotion
" Plugin 'Lokaltog/vim-easymotion'
" status bar
Plugin 'bling/vim-airline'
" display git diff, as sign for added, changed, removed lines
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" better highlighting for too long lines, instead of colorcolumn
Plugin 'gagoar/SmartColumnColors'
" highligh targets for f, F, t, T
Plugin 'unblevable/quick-scope'
" TODO: check out movement advice at https://github.com/unblevable/quick-scope
"Plugin 'tpope/vim-repeat'

"""""" colorschemes
Plugin 'Lokaltog/vim-distinguished'
Plugin 'michalbachowski/vim-wombat256mod'


""""""" general editing helps
" tabular alignment of text
Plugin 'godlygeek/tabular'

" checker for writing style
"Plugin 'reedes/vim-wordy'

" convert latex math stuff to unicode chars
Plugin 'joom/latex-unicoder.vim'


""""""" Programming related
" syntax checkers
Plugin 'scrooloose/syntastic'
" auto completion
if v:version > 703 || (v:version == 703 && has('patch584'))
    Plugin 'Valloric/YouCompleteMe'
    " Plugin 'Shougo/neocomplete.vim'
    " Plugin 'davidhalter/jedi-vim'
else
    " otherwise fallback to supertab
    Plugin 'ervandew/supertab'
endif
" file navigation
Plugin 'scrooloose/nerdtree'
" show functions/methods/classes etc.
Plugin 'majutsushi/tagbar'
" commenting code
Plugin 'scrooloose/nerdcommenter'
" Plugin 'tpope/vim-commentary'
" auto delimiter insertion
Plugin 'Raimondi/delimitMate'
"
"Plugin 'tpope/vim-surround'

""""" language support
Plugin 'vim-latex/vim-latex'
"Plugin 'voithos/vim-python-matchit'
" python mode combines several useful python plugins
" TODO: check whether to use python mode
"Plugin 'klen/python-mode'
Plugin 'tell-k/vim-autopep8'
Plugin 'nvie/vim-flake8'
Plugin 'dag/vim-fish'
"Plugin 'derekwyatt/vim-scala'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/yaml.vim'
Plugin 'plasticboy/vim-markdown'
"Plugin 'godlygeek/tabular'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" make vim a usable rust ide
Plugin 'rust-lang/rust.vim'


""""" required, end of plugin loading
call vundle#end()
filetype plugin indent on


""""" external/system plugins """""""

if file_readable(expand("$GOROOT/misc/vim/"))
    set rtp+=$GOROOT/misc/vim
elseif file_readable(expand("/usr/share/go/misc/vim/"))
    set rtp+=/usr/share/go/misc/vim/
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" we need this when using fish, or otherwise some plugins are fubar
set shell=/bin/bash
" disable vi compat
set nocompatible
" we want line numbers
set number
" Sets how many lines of history VIM has to remember
set history=700
" Set to auto read when a file is changed from the outside
set autoread
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" TODO: consider alternative leader
let mapleader = ";"
let g:mapleader = ";"
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set title
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*_build/*
set wildignore+=*build/*
set wildignore+=*/coverage/*

" let tab trigger auto completion
set wildchar=<Tab> wildmenu wildmode=full


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    "colorscheme github
    colorscheme wombat256mod
    set guioptions-=T
    set guioptions-=e
    " highlight ColorColumn guibg=lightgrey
else
    colorscheme darkdot
endif

if has("nvim") || has("gui_running")
	" copypasta from X clipboard
    nmap <leader>P "+gP
    nmap <leader>Y "+y
    vmap <leader>Y "+y
endif

if has("nvim")
    colorscheme wombat256mod
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set lbr
set textwidth=79

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" easy auto indentation
vmap Q gq
nmap Q gqap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move across wrapped lines like regular lines
" Go to the first non-blank character of a line
noremap 0 g^
" Just in case you need to go to the very beginning of a line
noremap ^ g0
noremap $ g$

" jumplist navigation without pressing shift...
map <C-i> <C-I>
map <C-o> <C-O>

set hidden

" Close the current buffer
map <leader>d :Bclose<cr>

" Close all the buffers
map <leader>da :1,1000 c!<cr>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction



"""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""

" forgot sudo? ;)
cmap w!! w !sudo tee % >/dev/null


" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" delete trailing whitespaces on write
autocmd BufWrite * :call DeleteTrailingWS()


func! EnableMoveHighlight()
  autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
endfunc


"""""""""""""""""""""""""""""""""""""
""""""""" Plugin settings """""""""""
"""""""""""""""""""""""""""""""""""""

map <buffer> <F4> :call Autopep8()<CR>

"""" for tagbar
map <F8> :TagbarToggle<CR>

"""" latex unidocder
let g:unicoder_no_map=0
nnoremap <leader>l :call unicoder#start(0)<CR>

"""" for airline
set laststatus=2

"""" for smartcolorcolumn
" configure this in filetype specific after/ftplugin/ files
" let g:smart_display_opts = { 'column' : 80 }

"""" settings for ctrlp
let g:ctrlp_max_height = 30
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>r :CtrlPMixed<cr>
let g:ctrlp_working_path_mode = 'a'

"""" for syntastic
" configure py/C checkers, although they are handled by YCM on recent vims
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_c_checkers = ['gcc']

"""" for vim-markdown
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1

"""" for rust.vim
" auto-format rust code on save
let g:rustfmt_autosave = 1
