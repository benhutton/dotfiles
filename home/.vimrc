set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

" Color
Plugin 'taxilian/herald.vim'

" Utilities
Plugin 'tpope/vim-dispatch'
Plugin 'minibufexpl.vim'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'

" Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

Plugin 'github/copilot.vim'

call vundle#end()
filetype plugin indent on

let nonerdtree=$NONERDTREE

autocmd!

syntax on
colorscheme herald
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11


set shiftwidth=2
set shiftround
set expandtab
set smarttab
set autoindent
set tabstop=2
set nowrap
set autowrite
set ruler
set nu!
set history=1000

"hiding toolbars:
set guioptions-=T
set guioptions-=m
set guioptions-=r

autocmd BufRead,BufNewFile *.mobile.erb set filetype=html
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" enable eclipse style moving of lines
nmap <M-j> mz:m+<CR>`z==
nmap <M-k> mz:m-2<CR>`z==
imap <M-j> <Esc>:m+<CR>==gi
imap <M-k> <Esc>:m-2<CR>==gi

" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" have the mouse enabled all the time:
set mouse=a

" don't have files trying to override this .vimrc:
set nomodeline

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault
" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>
" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$
" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>
" [<Ctrl>+V <Tab> still inserts an actual tab character.]
"""""""""""""""""""""""""""""
" Plugin Configuration

" NERDCommenter
let NERDSpaceDelims=1

" Run NERDTree by default and start with cursor in main window
if !(nonerdtree)
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
end

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" gist
let g:gist_open_browser_after_post = 1

" disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" get HMR working
set backupcopy=yes
