" Maintainer: 		    Yishi Xu
" Original template: 	Vundle - readme
" Last change: 	    	2016 Nov 11

"************************************************************
"*               Vundle Setup                               *
"************************************************************

" For the first time use, need to set up Vundle:
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required by Vundle
filetype off                  " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo

" vim tool
Plugin 'Yggdroot/indentLine'
Plugin 'terryma/vim-multiple-cursors'

" C and Python
Plugin 'Valloric/YouCompleteMe'         " Need manual compile
Plugin 'vim-syntastic/syntastic'        " Python - PEP8 checking

Plugin 'MarcWeber/vim-addon-mw-utils'   " snipmate dependency
Plugin 'tomtom/tlib_vim'                " snipmate dependency
Plugin 'garbas/vim-snipmate'            " snippet autocompletion

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"************************************************************
"*              Vim Configs                                 *
"************************************************************

" Theme
colorscheme desert

" Tab (PEP8) 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za 

" Highlight 
set hlsearch	" highlight search
set showmatch	" highlight match parenthesis

set number		" display line number
set history=1000



"************************************************************
"*              Quickly Run                                 *
"************************************************************

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
elseif &filetype == 'sh'
    :!time bash %
elseif &filetype == 'python'
    exec "!time python2.7 %"
elseif &filetype == 'html'
    exec "!firefox % &"
elseif &filetype == 'go'
    "   exec "!go build %<"
    exec "!time go run %"
elseif &filetype == 'mkd'
    exec "!~/.vim/markdown.pl % > %.html &"
    exec "!firefox %.html &"
endif
endfunc
