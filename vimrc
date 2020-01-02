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

set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" ---- Plugins

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'ryanoasis/vim-devicons'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'PProvost/vim-ps1'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'

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

" ---- FZF
nmap <leader>f :Files<CR>
nmap <leader>g :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>

" Buffers
nmap <Leader>p :bprevious<CR>
nmap <Leader>n :bnext<CR>
nmap <Leader>bd :bufdo bd<CR>

" ---- UtilSnips
"let g:UltiSnipsExpandTrigger="<c-s>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ---- Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=3

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

let g:airline_powerline_fonts = 1

if has("win32")
    set encoding=utf-8
    " Fucks with FZF :(
    "set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
endif

"---miscellaneous---"
if has("gui_running")
    autocmd VimResized * wincmd =
    autocmd GuiEnter * simalt ~x

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
set incsearch        " Incremental search
set autowrite        " Automatically save before commands like :next and :make
set hidden        " Hide buffers when they are abandoned
set mouse=vn        " Enable mouse usage (all modes)
"
" Disables middle mouse paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Windows
nmap <silent><C-l> :wincmd l<CR>
nmap <silent><C-h> :wincmd h<CR>
nmap <silent><C-j> :wincmd j<CR>
nmap <silent><C-k> :wincmd k<CR>
set splitbelow

"used to set the line numbers on load of vim
set number relativenumber

" Terminal
set termwinsize=10*0

" virtual tabstops using spaces
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent

" displays complete option in vim cmd line above
set wildmenu

set wrap

set diffopt+=iwhite
" Sets wrap when in diff mode 
au VimEnter * if &diff | execute 'windo set wrap' | endif

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

" Set spel when commiting with git
autocmd FileType gitcommit setlocal spell

" Show white space settings
silent hi SpecialKey
silent! hi SpecialKey guifg=Gray ctermfg=Gray  
set listchars=tab:/-,trail:*

set ignorecase

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
