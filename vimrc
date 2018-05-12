"
"his line should not be removed as it ensures that various options
"
"are properly set to work with the Vim-related packages available

"in Debian.
"lets vimingo-library.vim  play nice with debian
runtime! debian.vim

"TODO:
"mapping fo insert mode
" folding
" ctags
" html skeleton/other snippets
" better colors for merge! and Diff!
" shortcuts for errors
" backewards ctrl e brackets
" omni completion ??
" vim wiki
"
"----Vundle Config----"

"required for for vundle to run properly
set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()


"----plugin links----"

Plugin 'vundlevim/vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'micha/vim-colors-solarized'
Plugin 'akz92/vim-ionic2'
Plugin 'leafgarland/typescript-vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'quramy/tsuquyomi'
Plugin 'valloric/youcompleteme'

"----plugin settings----"

"----Powerline----#

"display status bar all the time
set laststatus=2

"removes the staus below line
set noshowmode

"----nerdcomenter----"
let NERDSpaceDelims=1

"----nerdtree---"

"used to toggle nerd tree
map <c-n> :NERDTreeTabsToggle<cr>

"----Auto-Pairs----"

"mapping for fast wrap
let g:AutoPairsShortcutFastWrap = '<C-e>'

"enables fly mode
let g:AutoPairsFlyMode = 1

"----Syntastic---"

"default settings to make shit usable asap
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

"perl error checker enabled
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_enable_perl_checker = 1

"sets the height of the window
let g:syntastic_loc_list_height=3

"allows for jshint js checking
let g:syntastic_javascript_checkers = ['eslint']

"allows for html angular template checking
let g:syntastic_html_checkers = ['htmlhint-ng2']

"typescript linting
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']

"----Super Tab----"

"allows for omni complete with super tab
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"lets super tab decide on completion type
"let g:SuperTabDefaultCompletionType = "context"

"----Vundle Config----"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
"---miscellaneous---"

"used to allow 256 colors in vim
"set t_Co=256

"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

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
