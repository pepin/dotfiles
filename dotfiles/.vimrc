" set !the tabstop and indent >> to 4chars
set tabstop=4
set shiftwidth=4
" make all tabs into spaces
set expandtab
set smartindent
set hls
set showmatch
" use visual bell
set vb
set background=dark

" use vim to backup files
set backup
set backupdir=~/var/vimbackup,~/.vimbackup,/tmp,.
set directory=~/var/vimbackup,~/.vimbackup,/tmp,.
" ignore case in searches
set ignorecase
" only do case SenSiTIve search when an uppercase char is used in the search
set smartcase
set nocompatible
" allow the cursor to move where there is no text currently
set virtualedit=all
set ai
set listchars=tab:\|_,trail:.
set list

" keep all changes to buffers without saving on switching
set hidden

" automatically save buffers on exit
" set autowrite

syntax on
syntax enable
filetype on
filetype indent on
filetype plugin on

" completion settings
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" remap-ctrl space just like visual studio for omnicompletion
inoremap <C-space> <C-x><C-o>

" mapping for switching windows with ctrl + hjkl
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" fullscreen current window
map <C-_> <C-W>_

map <F7> :nohls<CR>
map <F6> :set incsearch<CR>
:colors james
if &term =~ "xterm-256color"
    :colors james
    :set mouse=nv
endif

"==========NERDTree============
let NERDTreeWinSize=45


" quicker buffer switching with F5
":nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F2> :NERDTreeToggle<CR>
map <F3> :set mouse=<CR>
map <F4> :set mouse=a<CR>
nmap <silent> <Leader>c :nohls<CR>
nmap <silent> <unique> <Leader>tl :TlistToggle<CR>

" ++ tag jump
map <Leader>tj :tjump <c-r>=expand("<cword>") <cr><cr>

set laststatus=2
if exists('g:git_author_highlight')
    "show git status
    set statusline=%F%m%r%h%w\ [branch=%{GitBranch()}]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
else
    set statusline=%F%m%r%h%w\ [not\ on\ branch]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
endif


":set shell=/bin/bash\ --rcfile\ $HOME/.vimbashrc

set fileencodings=utf-8,latin1

" set this for showing vim session info in shell prompt
let $JP_SESSION_PROMPT_MARKER="<VIM SESSION> "

call pathogen#infect()

" pythonmode settings
let g:pymode_lint_ignore = "E501,E251,E231,E203,E201,E202,W601,E302,E303,W404,W901,E261,E702,E225,E401,E701,E221"

set foldlevel=0
