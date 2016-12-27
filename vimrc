"This line should not be removed as it ensures that various options
"are properly set to work with the Vim-related packages available

"in Debian.
"lets vim play nice with debian
runtime! debian.vim

"TO DO {{{1
"
"
"
"
" * folding
" * ctags
" * html skeleton/other snippets
" * better colors for merge! and Diff!
" * shortcuts for errors
" * backewards ctrl e brackets
" * omni completion ??
" * vim wiki
"
"}}}

"Plugins {{{1

"Vundle Config{{{2

"required for for vundle to run properly
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"}}}


"Plugin Links{{{2

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'

"}}}

"----plugin Settings----"

"Vim-Airline {{{2

"display status bar all the time
set laststatus=2

"used to set the theme
let g:airline_theme='solarized'

"used to remove powerline stuff
" the separator used on the left side
let g:airline_left_sep=''

" the separator used on the right side
let g:airline_right_sep=''

"remove encoding
let g:airline_section_y=''

"}}}
"NERCTree {{{2

"used to toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

"makes nerd tree prettier
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"}}}
"----Auto-Pairs----"{{{2

"mapping for fast wrap
let g:AutoPairsShortcutFastWrap = '<C-e>'

"enables fly mode
let g:AutoPairsFlyMode = 1

"}}}
"----Syntastic---"{{{2


"default settings to make shit usable asap
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1



"----Vundle Config----"{{{2

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"}}}

"}}}

"---miscellaneous---"

"used to allow 256 colors in vim
set t_Co=256

"sets the color scheme
colorscheme solarized

"makes solarized work well in terminal 
let g:solarized_termcolors=256

"allows transparency
let g:solarized_termtrans=1

" Vim5 and later versions support syntax highlighting. uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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

"sets more bash like completion for comands


"used to set the line numbers on load of vim
set number

" The width of a TAB is set to . Still it is a \t. It is just that
" Vim will interpret it to be having width of 3.
set tabstop=3

" Indents will have a width of 4
set shiftwidth=3

" Sets the number of columns for a TAB
set softtabstop=3

" Expand TABs to spaces
set expandtab

" Used to set the search to always highlight
set hls

"Used to disable the 'incremental Search'
set noic

"used to stop wrapping of text
set nowrap

"sets the max line length to 89 characters
set textwidth=69

"used to set a marker for number of columns
"set colorcolumn=70

"for colr of marker
"highlight ColorColumn ctermbg=darkgrey

"for color of marker
"highlight ColorColumn ctermbg=black

"sets the comment color
highlight Comment ctermfg=7

"used to change colors of auto complete menu
"menu
highlight Pmenu ctermfg=cyan ctermbg=black
"selected
highlight PmenuSel ctermfg=black ctermbg=cyan

"sets spell colors
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"vim diff colors temp location
hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta

"to wrap text at 69
set wrapmargin=69

"used to set the terminals title to show the file name in xterm title
let &titlestring =expand("%:t")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif

if &term == "screen" || &term == "xterm"
  set title
endif

"used for mapping split navigation
nmap <silent><C-l> :wincmd l<CR>
nmap <silent><C-h> :wincmd h<CR>
nmap <silent><C-j> :wincmd j<CR>
nmap <silent><C-k> :wincmd k<CR>

"used to enable spell check
map <F2> :setlocal spell! spelllang=en_us<CR>

"Remove all trailing whitespace by pressing F3
nnoremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"used to change colors of auto complete menu
"menu
highlight Pmenu ctermfg=cyan ctermbg=black
"selected
highlight PmenuSel ctermfg=black ctermbg=cyan

"-----------------------"
"------For Web Dev------"
"-----------------------"

"for auto save on unfocus
autocmd BufLeave,FocusLost * silent! wall<CR>

"used to launch current html in CHROME
au FileType javascript noremap <F5> :!google-chrome %<CR>
au FileType html noremap <F5> :!google-chrome %<CR>
au FileType php  noremap <F5> :!google-chrome %<CR>

"used to transfer just the current file
au FileType javascript noremap <F6> :w <bar> !/etc/vim/scripts/ftpFile.sh '%:p' '%:p:h:t'<CR>
au FileType html noremap <F6> :w <bar> !/etc/vim/scripts/ftpFile.sh '%:p' '%:p:h:t'<CR>
au FileType php noremap <F6> :w <bar> !/etc/vim/scripts/ftpFile.sh '%:p' '%:p:h:t'<CR>


"----------------------"
"-----For Java Dev-----"
"----------------------"

"used to compile java current java file
au FileType java noremap <F5> :w <bar> :!javac %<CR>

"used to run the current java file
au FileType java noremap <f6> :!java %:r<CR>

"---------------------"
"-----For Python------"
"---------------------"

"used to run a python file
au FileType python noremap <F5> :w <bar> :!python %<CR>

"---------------------"
"------For Vim--------"
"---------------------"

