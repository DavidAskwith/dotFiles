"TODO:
" ---------------------------------------------------

" ctags
" html skeleton/other snippets
" shortcuts for errors
" vim wiki

" ---------------------------------------------------

"in Debian.
"lets vimingo-library.vim  play nice with debian
runtime! debian.vim

"---- Vundle Config

" Required for for vundle to run properly
set nocompatible
filetype off
"set rtp+=~/.vim/bundle/vundle.vim
"call vundle#begin()

set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" ---- Plugins

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'morhetz/gruvbox'
Plugin 'akz92/vim-ionic2'
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'
Plugin 'PProvost/vim-ps1'

" Linux specific
if has("unix")
    Plugin 'valloric/youcompleteme'
endif

" Windows specific
if has("win32")
    Plugin 'ervandew/supertab'
    Plugin 'vim-airline/vim-airline'
endif

" ---- Plugin settings

" ---- Airline
let g:airline#extensions#tabline#enabled = 1

" ---- Powerline

" Display status bar all the time
set laststatus=2
" Removes the status below line
set noshowmode

" ---- NERDTree

map <c-n> :NERDTreeTabsToggle<cr>
let NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_open_on_gui_startup=0

" ---- Syntastic

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" :set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=3
:
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_enable_perl_checker = 1

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_html_checkers = ['htmlhint-ng2']

let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:tsuquyomi_disable_quickfix = 1

" ---- Super Tab

" Might cause issues with youcompleteme
"allows for omni complete with super tab
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,longest

let g:SuperTabDefaultCompletionType = "context"
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif


" ---- vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"----Vundle Config----"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if has("unix")
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif
if has("win32")

    set encoding=utf-8
    let g:airline_powerline_fonts = 1

    " Fullscreen for diff
    if has("gui_running")
        autocmd VimResized * wincmd =
        autocmd GuiEnter * simalt ~x
    endif

endif

"---miscellaneous---"
if has("gui_running")
    set guioptions -=T
    set guioptions -=r
    set guioptions -=L
    set lines=40 columns=150
endif

"allows for regular backspace in gvim
set backspace=2
set backspace=indent,eol,start

"used to allow 256 colors in vim
"set t_Co=256

colorscheme gruvbox

" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

autocmd BufEnter *.cls :setlocal filetype=vb

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Sets the guifont for gvim
set guifont=consolas\ NF:h12

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd        " Show (partial) command in status line.
set showmatch        " Show matching brackets.
set ignorecase        " Do case insensitive matching
set smartcase        " Do smart case matching
set incsearch        " Incremental search
set autowrite        " Automatically save before commands like :next and :make
set hidden        " Hide buffers when they are abandoned
set mouse=a        " Enable mouse usage (all modes)
"
" Disables middle mouse paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

"used for mapping split navigation
nmap <silent><C-l> :wincmd l<CR>
nmap <silent><C-h> :wincmd h<CR>
nmap <silent><C-j> :wincmd j<CR>
nmap <silent><C-k> :wincmd k<CR>

"used to set the line numbers on load of vim
set number relativenumber

" virtual tabstops using spaces
set shiftwidth=4
set softtabstop=4
set expandtab

" displays complete option in vim cmd line above
set wildmenu

" allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set softtabstop=0
    set shiftwidth=0
    set tabstop=8
    set noexpandtab
  else
    set softtabstop=4
    set shiftwidth=4
    set tabstop=4
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

" Sets indent tabs
au FileType aspvbs setlocal tabstop=8 softtabstop=0 shiftwidth=0 noexpandtab
au FileType sql setlocal tabstop=8 softtabstop=0 shiftwidth=0 noexpandtab

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Search within visual selction
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

"Spacing for HTML
au FileType html set tabstop=2
au FileType html set shiftwidth=2
au FileType html set softtabstop=2

"Spacing for markdown
au FileType markdown set tabstop=2
au FileType markdown set shiftwidth=2
au FileType markdown set softtabstop=2

"Spacing for python
au FileType python set tabstop=4
au FileType python set shiftwidth=4
au FileType python set softtabstop=4

" Show white space settings
silent hi SpecialKey
silent! hi SpecialKey guifg=Gray ctermfg=Gray  
set listchars=tab:/-,trail:*

set ignorecase

"used to stop wrapping of text
set nowrap

"used to enable spell check
map <F2> :setlocal spell! spelllang=en_us<CR>

"Remove all trailing whitespace by pressing F3
nnoremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"new lines below in normal mode
nmap <CR> o<Esc>

"enables taging jumping with %
runtime macros/matchit.vim

"Allows for saving as root
cmap w!! w !sudo tee > /dev/null %

"used to launch current html in CHROME
au FileType html noremap <F5> :!chromium %<CR>

