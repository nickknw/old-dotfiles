noremap ; :
noremap : ;
nnoremap <esc> :noh<return><esc>
imap <C-BS> <C-W>
imap <C-Del> <esc>Ea<C-W>

set lines=28 columns=100

"set statusline=%F%m%r%h%w\ \ --\ \ %{&ff}\ %Y\ \ --\ \ Ln\ %l\ \ Col\ %v\ \ --\ \ %p%%\ of| %L lines

"set clipboard=unnamed

"cd ~\My\ Documents\notes\
colo desert

" CTRL-V is Paste in insert mode
imap <C-V>		"+gpa
" CTRL-C is Copy, CTRL-X is Cut, in visual mode
vmap <C-C>		"+y
vmap <C-x>		"+d
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

if has("gui_running")
    set guioptions-=m "remove menu
    set guioptions-=T "remove toolbar
    set guioptions-=l "remove left scrollbar
"    set guioptions+=b
"    set nowrap

endif

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showmode
set showcmd
set nu
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set incsearch

cab W w
nmap <silent> <F10> ;NERDTreeToggle<CR>

"Window switching
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

if has("autocmd")
  "html tag jumping
  autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType smarty let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'

  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis 


