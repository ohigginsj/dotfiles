" Must be set before anything else
set nocompatible " use vim defaults

" General
set number                     " show line numbers
set backspace=indent,eol,start " make that backspace key work the way it should
set showcmd                    " display incomplete commands
set scrolloff=3                " keep 3 lines when scrolling
set nobackup                   " do not keep a backup file
set novisualbell               " turn off visual bell
set visualbell t_vb=           " turn off error beep/flash
set lazyredraw                 " for macros
set ruler                      " show the current row and column
set hidden                     " buffers can exist without being in a window
set autoread                   " reload files changed externally
set laststatus=2               " space for airline
let mapleader=","              " backslash is silly

" Indentation
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cinoptions=(0,W4 " Indent to open parenthesis

set list
set listchars=trail:·,tab:»· " Display tabs and trailing spaces

set nowrap    " Don't wrap lines
set linebreak " Wrap lines at convenient points

" Search
set hlsearch   " highlight searches
set incsearch  " do incremental searching
set showmatch  " jump to matches when entering regexp
set ignorecase " ignore case when searching
set smartcase  " no ignorecase if Uppercase char present

" Programming-specific
syntax on                  " turn syntax highlighting on by default
filetype plugin indent on  " load indent file for specific file type
au FileType * setl fo-=cro " disable autocomment, which is enabled by filtype plugin

" Plugin Configuration
let g:lightline = {
    \ 'colorscheme': '16color',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \}


let g:clighter_libclang_file = '/usr/lib/libclang.so'

" Load Plugins
call plug#begin('~/.vim/plugged')
Plug 'bbchung/clighter'
Plug 'fholgado/minibufexpl.vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'bkad/CamelCaseMotion'
call plug#end()

" Cursor
let &t_SI .= "\<Esc>[1 q" " insert mode: blinking block
let &t_EI .= "\<Esc>[2 q" " other modes: solid block

" Color
" cterm
"NR-16   NR-8    COLOR NAME
"0       0       Black
"1       4       DarkBlue
"2       2       DarkGreen
"3       6       DarkCyan
"4       1       DarkRed
"5       5       DarkMagenta
"6       3       Brown, DarkYellow
"7       7       LightGray, LightGrey, Gray, Grey
"8       0*      DarkGray, DarkGrey
"9       4*      Blue, LightBlue
"10      2*      Green, LightGreen
"11      6*      Cyan, LightCyan
"12      1*      Red, LightRed
"13      5*      Magenta, LightMagenta
"14      3*      Yellow, LightYellow
"15      7*      White
set t_Co=16
set background=dark
colorscheme default
highlight Search cterm=NONE ctermfg=white ctermbg=black
highlight Type ctermfg=green
" clighter
"highlight cligherInclusionDirective cterm=NONE ctermfg=magenta     ctermbg=NONE
"highlight clighterRef               cterm=NONE ctermfg=red         ctermbg=NONE
"highlight clighterDecl              cterm=NONE ctermfg=green       ctermbg=NONE
"highlight clighterTemplateTypeParameter cterm=NONE ctermfg=white       ctermbg=NONE
"highlight clighterTemplateRef       cterm=NONE ctermfg=yellow       ctermbg=NONE
highlight clighterPrepro             cterm=NONE ctermfg=darkmagenta ctermbg=NONE
highlight clighterMacroInstantiation cterm=NONE ctermfg=darkred     ctermbg=NONE
highlight clighterTypeRef            cterm=NONE ctermfg=brown       ctermbg=NONE
highlight clighterFieldDecl          cterm=NONE ctermfg=white       ctermbg=NONE
highlight clighterFunctionDecl       cterm=NONE ctermfg=darkgreen   ctermbg=NONE
highlight clighterMemberRefExprCall  cterm=NONE ctermfg=darkgreen   ctermbg=NONE
highlight clighterDeclRefExprCall    cterm=NONE ctermfg=darkgreen   ctermbg=NONE
highlight clighterVarDecl            cterm=NONE ctermfg=white       ctermbg=NONE
highlight clighterParmDecl           cterm=NONE ctermfg=white       ctermbg=NONE
highlight clighterDeclRefExprTypedef cterm=NONE ctermfg=yellow      ctermbg=NONE
highlight clighterDeclRefExprPointer cterm=NONE ctermfg=yellow      ctermbg=NONE
highlight clighterMemberRefExprVar   cterm=NONE ctermfg=cyan        ctermbg=NONE
highlight clighterStructDecl         cterm=NONE ctermfg=brown       ctermbg=NONE
highlight clighterEnumDecl           cterm=NONE ctermfg=brown       ctermbg=NONE
highlight clighterUnionDecl          cterm=NONE ctermfg=brown       ctermbg=NONE
highlight clighterClassDecl          cterm=NONE ctermfg=brown       ctermbg=NONE
highlight clighterEnumConstantDecl   cterm=NONE ctermfg=magenta     ctermbg=NONE
highlight clighterDeclRefExprEnum    cterm=NONE ctermfg=magenta     ctermbg=NONE
highlight clighterNamespace          cterm=NONE ctermfg=red         ctermbg=NONE
highlight clighterNamespaceRef       cterm=NONE ctermfg=magenta     ctermbg=NONE
highlight default link clighterOccurrences IncSearch

" minibuf explorer
highlight MBENormal               ctermfg=darkgreen ctermbg=NONE
highlight MBEChanged              ctermfg=darkred   ctermbg=NONE
highlight MBEVisibleNormal        ctermfg=gray      ctermbg=NONE
highlight MBEVisibleChanged       ctermfg=darkred   ctermbg=NONE
highlight MBEVisibleActiveNormal  ctermfg=gray      ctermbg=darkblue
highlight MBEVisibleActiveChanged ctermfg=darkred   ctermbg=darkblue

" Keymaps
" Split Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" Ctrl-/ clears search highlight. Vim wants a '_' instead of '/' for some reason
nnoremap <silent> <C-_> :nohlsearch<CR><C-_>

" Remap Make command and redraw over terminal output
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
