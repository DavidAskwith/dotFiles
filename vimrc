"TODO:
" ---------------------------------------------------

" ctags
" html skeleton/other snippets
" shortcuts for errors
" backewards ctrl e brackets
" vim wiki

" ---------------------------------------------------

"in Debian.
"lets vimingo-library.vim  play nice with debian
runtime! debian.vim

"---- Vundle Config

" Required for for vundle to run properly
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" ---- Plugins

Plugin 'vundlevim/vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'micha/vim-colors-solarized'
Plugin 'akz92/vim-ionic2'
Plugin 'leafgarland/typescript-vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'quramy/tsuquyomi'

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

" ---- NerdCommenter

let NERDSpaceDelims=1

" ---- NERDTree

map <c-n> :NERDTreeTabsToggle<cr>
let NERDTreeQuitOnOpen=1
let g:nerdtree_tabs_open_on_gui_startup=0

"----Auto-Pairs----"

let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairsFlyMode = 1

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
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"lets super tab decide on completion type
let g:SuperTabDefaultCompletionType = "context"

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
      if &diff
        autocmd VimResized * wincmd =
        autocmd GuiEnter * simalt ~x
      endif
    endif
endif

"---miscellaneous---"
set guioptions -=T
":set guioptions -=m
set guioptions -=r
set guioptions -=L
set lines=40 columns=150

"allows for regular backspace in gvim
set backspace=2
set backspace=indent,eol,start

"used to allow 256 colors in vim
"set t_Co=256

"sets terminal for solarized theme
let g:solarized_termcolors=256
let g:solarized_termtrans = 1

"sets the color scheme
colorscheme solarized

" Vim5 and later versions support syntax highlighting. uncommenting the next
"
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Sets the guifont for gvim
set guifont=consolas\ NF:h12

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
  "au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

"used for mapping split navigation
nmap <silent><C-l> :wincmd l<CR>
nmap <silent><C-h> :wincmd h<CR>
nmap <silent><C-j> :wincmd j<CR>
nmap <silent><C-k> :wincmd k<CR>

"used to set the line numbers on load of vim
set relativenumber

"indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"
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

"Spacing for JavaScript
au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2

"Spacing for JavaScript
au FileType typescript set tabstop=2
au FileType typescript set shiftwidth=2
au FileType typescript set softtabstop=2

"Spacing for python
au FileType python set tabstop=4
au FileType python set shiftwidth=4
au FileType python set softtabstop=4

"Used to disable the 'incremental Search'
set noic

"used to stop wrapping of text
set nowrap

"used to enable spell check
map <F2> :setlocal spell! spelllang=en_us<CR>

"Remove all trailing whitespace by pressing F3
nnoremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"new lines below in normal mode
"not working....
"nmap <S-CR>O<Esc>
nmap <CR> o<Esc>

"enables taging jumping with %
runtime macros/matchit.vim

"Allows for saving as root
cmap w!! w !sudo tee > /dev/null %

"----For Web Dev----"

"used to launch current html in CHROME
au FileType html noremap <F5> :!chromium %<CR>

"----For Java Dev----"

"used to compile java current java file
au FileType java noremap <F5> :w <bar> :!javac %<CR>

"used to run the current java file
au FileType java noremap <f6> :!java %:r<CR>

"----For Python-----"

"used to run a python file
au FileType python noremap <F5> :w <bar> :!python %<CR>

"----Bash-----"

"runs bash scripts
au FileType bash noremap <F5> :w <bar> :!sh %<CR>

"----perl----"

"runs perl scripts with f5
au FileType perl noremap <F5> :w <bar> :!perl %<CR>

