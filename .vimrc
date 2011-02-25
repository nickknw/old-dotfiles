" vim: foldmethod=marker foldlevel=1 

" Basic Defaults {{{
" --------------------------------
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50          " keep 50 lines of command line history
set showmode            " If in Insert, Replace or Visual mode put a message on the last line
set nu                  " show line numbers
set display=lastline    " include as much of the last line as possible
set wildmenu            " better command autocompletion
set winaltkeys=no       " don't use alt keys for menus
set foldmethod=marker
set cryptmethod=blowfish
set textwidth=80
set colorcolumn=0       " keep at 0 by default, but offer a mapping later on to change it
set linebreak           " break lines at word boundaries instead of anywhere in the word (display only)

" Use spaces instead of tabs, indent level should be 4
set tabstop=8           
set softtabstop=4
set shiftwidth=4
set expandtab

" clever indenting
set autoindent
set smartindent

" searching related
set incsearch
set hlsearch
set smartcase

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000     "maximum number of changes that can be undone
set undoreload=10000    "maximum number lines to save for undo on a buffer reload

" When editing a file, always jump to the last cursor position
if has("autocmd") 
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis 

" }}}

" More Personalized Settings {{{
" --------------------------------

" share clipboard with Windows
set clipboard=unnamed  

" make sure I'm starting in my home dir, not Prog Files\Vim etc.
cd ~  

set gfn=DejaVu\ Sans\ Mono\ 10
" I switch often between these 
" colo vc 
colo desert

" preferred window size
set lines=25
set columns=80

" stop these files from being scattered all over
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" stop inserting comments on 'o' or 'O'!
set formatoptions=cqnr

" no menus
if has("gui_running")
    set guioptions-=m "remove menu
    set guioptions-=T "remove toolbar
    set guioptions-=l "remove left scrollbar
    "set guioptions+=b
    "set nowrap
endif

" statusline related
set laststatus=2        "always show statusline
set showcmd             "show partial commands below statusline
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*fugitive#statusline')?fugitive#statusline():''}%*%=%-16(\ %l,%c%V\ %)%P\ of\ %L

" }}}

" My Mappings {{{
" --------------------------------

" best mapping ever - swap ; and :
noremap ; :
noremap : ;

"Change directory to the dir of the current buffer
noremap \cd :cd %:p:h<CR>  

" clear highlighting on <esc> press
nnoremap <esc><esc> :noh<return><esc>

" Make C-BS and C-Del work like they do in most text editors for the sake of muscle memory
imap <C-BS> <C-W>
imap <C-Del> <esc>Ea<C-W>

" Windows-like copy/cut/paste mappings
" CTRL-V is Paste in insert mode
imap <C-V>              *
" CTRL-C is Copy, CTRL-X is Cut, in visual mode
vmap <C-C>              y
vmap <C-x>              d
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>           <C-V>

" Window switching
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" gf is 'go to file', gnf is now 'go to file in new window'
nnoremap gnf <c-w><c-f>

" make editing a temp macro in register q more convenient
noremap qp mqGo<Esc>"qp
noremap qd G0"qd$`q

vnoremap * y/<C-R>"<CR>

noremap <F8> <Esc>:call ToggleColorColumn()<CR>
" }}}

" Plugin-related {{{
" --------------------------------

"for vimwiki
filetype plugin on

" make it easier to view pictures from vimwiki
" this one took some time. would be easier to read as a function, but I was
" having a hard time finding the equivalent of ^Rh in a function.
" autocmd FileType vimwiki noremap \wi f]h"iyi]:redir => h<CR>:echo $HOME<CR>:redir END<CR>:let @h=substitute(h,"\n","","g")<CR>:!start rundll32.exe C:\WINDOWS\System32\shimgvw.dll,ImageView_Fullscreen h\vimwiki\i<CR><CR>

" stop vimwiki from taking over my <c-i>
" and remap <S-Tab> as well for consistency
map <Leader>wn <Plug>VimwikiNextLink
map <Leader>wp <Plug>VimwikiPrevLink

noremap <silent> <F10> :NERDTreeToggle<CR>

noremap \e :FufFileWithCurrentBufferDir **/<CR>
noremap \b :FufBuffer<CR>

" http://stackoverflow.com/questions/4294116/problem-with-vims-ruby-plugin
"let g:ruby_path = ':C:\ruby192\bin'

" refresh fugitive status on gaining focus
autocmd FocusGained * if !has('win32') | silent! call fugitive#reload_status() | endif

" }}}

" Filetype-specific commands {{{
" --------------------------------

if has("autocmd")
  "html tag jumping with %
  autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType smarty let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'
  
  " vb jumping with %
  let s:notend = '\%(\<end\s\+\)\@<!'
  autocmd FileType vbnet let b:match_words = '#Region:#End Region,' . s:notend . '\<If\>:\<End\s\+If\>,\<For\s\+Each\>:\<Next\>,' . s:notend . '\<Function\>:\<End Function\>'
  
  " special vbnet highlighting
  autocmd BufNewFile,BufRead *.vb set ft=vbnet
  au BufNewFile,BufRead *vb.wordfreq setf vbnet

   " In text files act like notepad
  autocmd BufRead *.txt set nowrap
  autocmd BufRead *.txt set go+=b
endif

" }}}

" Functions {{{
" --------------------------------
func! CountSearch()
    let cs=getpos('.')
    redir => search
    silent :%s//&/nge
    redir END
    call setpos('.', cs)

    if search != ''
        let s=split(substitute(search, '\n', '', ''), ' ')
        let search=s[0] . '/' . s[3]
    else
        let search='0/0'
    endif

    return @/ . ': ' . search
endfunc 

func! ToggleColorColumn()
    if(&colorcolumn==0)
        set colorcolumn=80
    else
        set colorcolumn=0
    endif
endfunc

func! VimwikiCreateSearchPage()
    let home=expand('~')
    let res=system('ruby "' . home . '\vimwiki_html\createSearchPage.rb"')
endfunc

"autocmd FileType vimwiki noremap \wi f]h"iyi]:redir => h<CR>:echo $HOME<CR>:redir END<CR>:let @h=substitute(h,"\n","","g")<CR>:!start rundll32.exe C:\WINDOWS\System32\shimgvw.dll,ImageView_Fullscreen h\vimwiki\i<CR><CR>


"func! VimwikiViewImage()
"    let home=expand('~')
"    let res=system('start rundll32.exe C:\WINDOWS\System32\shimgvw.dll,ImageView_Fullscreen ' . home . '\vimwiki\' . i)
"endfunc

"exe "normal a".res
func! VimwikiCopyImages()
    let home=expand('~')
    "let res=system('xcopy "' . home . '\vimwiki\*.png" "' . home .  '\vimwiki_html\" /R/Y')
endfunc
" }}}\
