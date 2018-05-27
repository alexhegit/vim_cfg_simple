" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set smartindent
set autoindent
set cindent
"set nu 
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

"colorscheme wuye
colorscheme evening 

"for chinese language
set encoding=UTF-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=utf-8,gbk,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
   syntax on
   set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


"------------------------------
" TagList:Tlist
" -----------------------------
let Tlist_Use_Left_Window=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_WinHeight=1
let Tlist_WinWidth=40
"let Tlist_Auto_Open=1
let Tlist_File_Fold_Auto_Close=1
nnoremap <silent> <F8> :TlistToggle<CR>
let g:winManagerWindowLayout='FileExplorer|TagList'
highlight MyTagListTagName guifg=blue ctermfg=blue

"------------------------------
" Fencview
"------------------------------
let g:fencview_autodetect=1


"------------------------------
" WordComplete
"------------------------------
:autocmd BufEnter * call DoWordComplete() 

"------------------------------
" WinManager:WMToggle
"------------------------------
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr>

"------------------------------
" cscope
"------------------------------
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"set cscopetag
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<cr><cr> :cw<cr>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<cr><cr> :cw<cr>
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
"nmap <C-_>t :cs find t <C-R>=expand("<cword>")<cr><cr> :cw<cr>
"nmap <C-_>e :cs find e <C-R>=expand("<cword>")<cr><cr> :cw<cr>
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
"nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<cr><cr> :cw<cr>
"nmap <C-_>d :cs find d <C-R>=expand("<cword>")<cr><cr> :cw<cr>


"解决vim中文编码问题
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

