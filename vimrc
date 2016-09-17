" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by " the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
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
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
filetype plugin indent on
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


"used to set the line numbers on load of vim
"set number

" The width of a TAB is set to 4. Still it is a \t. It is just that
" Vim will interpret it to be having width of 4.
set tabstop=3

" Indents will have a width of 4
set shiftwidth=3

" Sets the number of columns for a TAB
set softtabstop=3 

" Expand TABs to spaces
set expandtab

" Used to set the search to allways highlight
set hls 

"Used to disable the 'incremental Search'
set noic

"used to stop wrapping of text
set nowrap

"setd the max line length to 89 characters
set textwidth=89

"used to set the terminals title to show the file name in xterm title
let &titlestring =expand("%:t")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif

if &term == "screen" || &term == "xterm"
  set title
endif

"sets the coment color
highlight Comment ctermfg=7

"used to add copy and paste comands
noremap <C-c> "+y
noremap <C-p> "+p


"-------------------"
"----For Web Dev----"
"-------------------"

   "used to launch curent html in CHROME
   au FileType javascript noremap <F5> :!google-chrome %<CR>
   au FileType html noremap <F5> :!google-chrome %<CR>
   au FileType php  noremap <F5> :!google-chrome %<CR>
      
   "used to transfer just the curent file
   au FileType javascript noremap <F6> :w <bar> !/etc/vim/scripts/ftpFile.sh '%:p' '%:p:h:t'<CR>
   au FileType html noremap <F6> :w <bar> !/etc/vim/scripts/ftpFile.sh '%:p' '%:p:h:t'<CR>
   au FileType php noremap <F6> :w <bar> !/etc/vim/scripts/ftpFile.sh '%:p' '%:p:h:t'<CR>

   "---IN PROGRESS used to automate ftp transfer for web dev
   "noremap <F7> :! /etc/vim/scripts/ftpProject.sh<CR>


"-------------------"
"----For Java Dev---"
"-------------------"

   "used to compile java curent java file
   au FileType java noremap <F5> :w <bar> :!javac %<CR>

   "used to run the curent java file 
   au FileType java noremap <f6> :!java %:r<CR>


   "
