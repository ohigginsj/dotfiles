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
set noswapfile                 "
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

" Whitespace
set list
set listchars=trail:·,tab:»· " Display tabs and trailing spaces

" Wrapping
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
au FileType * setl fo-=cro " disable autocomment, which is enabled by filetype plugin
set makeprg=./build.sh

" Filetype associations
au BufNewFile,BufRead *.vertex set filetype=glsl
au BufNewFile,BufRead *.fragment set filetype=glsl

" Load Plugins
call plug#begin('~/.vim/plugged')
Plug 'jeaye/color_coded'
Plug 'bkad/CamelCaseMotion'
Plug 'cespare/vim-toml'
Plug 'ervandew/supertab'
" Plug 'fholgado/minibufexpl.vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-smooth-scroll'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
call plug#end()

" Plugin Configuration
" lightline
let g:lightline = {
    \ 'colorscheme': '16color',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \}
" CtrlP
let g:ctrlp_map =  '<leader>f'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_switch_buffer =  '0'

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
" General
hi Comment          ctermfg=darkblue
hi Constant         ctermfg=darkred
    hi String       ctermfg=cyan
    hi Character    ctermfg=cyan
    hi Number       ctermfg=red
    hi Boolean      ctermfg=red
    hi Float        ctermfg=red
hi Special          ctermfg=darkmagenta
hi Indentifier      ctermfg=red
    hi Function     ctermfg=blue
hi Statement        ctermfg=brown
    hi Conditional  ctermfg=brown
    hi Repeat       ctermfg=brown
    hi Label        ctermfg=brown
    hi Operator     ctermfg=brown
    hi Keyword      ctermfg=brown
    hi Exception    ctermfg=brown
hi PreProc          ctermfg=darkmagenta
    hi Include      ctermfg=darkmagenta
    hi Define       ctermfg=darkmagenta
    hi Macro        ctermfg=darkmagenta
    hi PreCondit    ctermfg=darkmagenta
hi Type             ctermfg=green
    hi StorageClass ctermfg=green
    hi Structure    ctermfg=green
    hi Typedef      ctermfg=green
hi Variable         ctermfg=lightgray
hi EnumConstant     ctermfg=magenta
" color_coded
hi StructDecl         ctermfg=brown
hi UnionDecl          ctermfg=brown
hi EnumDecl           ctermfg=brown
hi FieldDecl          ctermfg=white
hi EnumConstantDecl   ctermfg=magenta
hi FunctionDecl       ctermfg=darkgreen
hi VarDecl            ctermfg=white
hi ParmDecl           ctermfg=white
hi TypedefDecl        ctermfg=red
hi TypeRef            ctermfg=brown
hi LabelRef           ctermfg=brown
hi DeclRefExpr        ctermfg=red
hi MemberRefExpr      ctermfg=green
hi CallExpr           ctermfg=white
hi BlockExpr          ctermfg=red
hi MacroDefinition    ctermfg=darkgray
hi MacroInstantiation ctermfg=darkred

" folds
highlight Folded                  ctermfg=yellow   ctermbg=darkblue

" easymotion
highlight EasyMotionTarget        ctermfg=darkred   ctermbg=none
highlight EasyMotionShade         ctermfg=darkblue  ctermbg=none
highlight EasyMotionTarget2First  ctermfg=yellow    ctermbg=none
highlight EasyMotionTarget2Second ctermfg=magenta   ctermbg=none

" minibuf explorer
highlight MBENormal               ctermfg=darkgreen ctermbg=none
highlight MBEChanged              ctermfg=darkred   ctermbg=none
highlight MBEVisibleNormal        ctermfg=gray      ctermbg=none
highlight MBEVisibleChanged       ctermfg=darkred   ctermbg=none
highlight MBEVisibleActiveNormal  ctermfg=gray      ctermbg=darkblue
highlight MBEVisibleActiveChanged ctermfg=darkred   ctermbg=darkblue

" Todo, Note
highlight Todo term=bold ctermfg=red ctermbg=none

" Keymaps

" Leader mappings
nnoremap ; :

" Ag mappings
map <C-P> "zyiw:exe "Ag ".@z.""<CR>

" CamelCaseMotion"
call camelcasemotion#CreateMotionMappings(',')

" Split Navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Don't cancel visual select when shifting
xnoremap < <gv
xnoremap > >gv

" Yank and paste from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Ctrl-/ clears search highlight. Vim wants a '_' instead of '/' for some reason
nnoremap <silent> <C-_> :nohlsearch<CR><C-_>

" Smooth scrolling
nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 4)<CR>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

" Remap Make command and redraw over terminal output
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
command! -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'
nnoremap <leader>r :Silent ./run.sh<CR>
