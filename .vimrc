" Vimrc
" PLUGINS {{{
    call plug#begin('~/.vim/plugins')

    Plug 'sjl/badwolf'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-commentary' " gcc - comment whole line, gc - comment in visual mode
    " Plug 'https://github.com/w0rp/ale.git' " nie dziala
    " Plug 'severin-lemaignan/vim-minimap' " nie dziala bo brakuje python supporta 
    Plug 'ramele/agrep' " asynchronous grep
    Plug 'Valloric/YouCompleteMe'

    " Call :PlugInstall in vim to install plugins
    " :PlugUpdate :PlugDiff
    " :PlugClean after deleting plugin
    call plug#end()
" }}}
" PLUGIN SETTINGS {{{
    " Airline {{{
        set laststatus=2
        let g:airline_theme = 'zenburn'
        " let g:airline_left_sep = ''
        " let g:airline_left_sep = ''
        " let g:airline_right_sep = ''
        " let g:airline_right_sep = ''
    " }}}
" YouCompleteMe {{{
    let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" }}}
" }}}
" GENERAL SETTINGS {{{
    " Colors {{{
        syntax enable
        colorscheme afterglow
        set t_Co=256
    " }}}
    " Misc {{{
        " enter the current millenium
        set nocompatible

        " Copying and pasting from global clipboard
        set clipboard=unnamed

        set backspace=indent,eol,start
        set mouse=a " enable use of the mouse for all modes
        set textwidth=0
        set wrapmargin=0
        set history=100 " 100 instead of 12

        " disable preview ( for example new window in YouCompleteMe plugin
        set completeopt-=preview
    " }}}
    " Spaces & tabs {{{
        set tabstop=4
        set expandtab
        set softtabstop=4
        set shiftwidth=4
        set modeline
        set modelines=1
        filetype indent on
        filetype plugin on
        set autoindent
    " }}}
    " UI Layout {{{
        set number	" show line numbers
        set showcmd	" show command in bottom bar
        set cursorline	" highlight current line
        set colorcolumn=80
        set wildmenu	" autocompletion in menu with TAB
        set ruler       " cursor position in the status bar
        set lazyredraw	" buffer screen updates instead of updating it all time
        "turn off beep and visualbell
        set visualbell
        set t_vb=
        " Instead of failing a command because of unsaved changes, instead raise a
        " dialogue asking if you wish to save changed files.
        set confirm
        " set fillchars+=vert:|
    " }}}
    " Searching {{{
        set ignorecase	" ignore case when searching
        set smartcase   " except when using capital letters
        set incsearch	" search as characters are entered
        set hlsearch	" highlight all matches
        set showmatch	" highlight current parenthesis
        set matchpairs+=<:>
    " }}}
    " Folding {{{
        set foldmethod=indent	" fold based on indent level
        set foldnestmax=10	" max 10 depth
        set foldenable		" don't fold files by default on open
        " toggle folding:
        nnoremap <space> za
        set foldlevelstart=10	" start with fold level of 1
    " }}}
" }}}
" MAPPINGS {{{
    " Line Shortcuts {{{
        " Skip 'fake' lines - wrapped ones
        nnoremap j gj
        nnoremap k gk
        " highlight last inserted text
        nnoremap gV `[v`]
    " }}}
    " Normal Mode Shortcuts {{{
        nnoremap ; :
        " Easy window navigation
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l

        noremap <C-up> <C-w>k 
        noremap <C-down> <C-w>j 
        noremap <C-left> <C-w>h 
        noremap <C-right> <C-w>l 
    " }}}
    " Insert Mode Shortcuts {{{
        " inoremap jk <ESC> 
    " }}}
    " Leader Shortcuts {{{
        " <leader> = \
        let mapleader=","	" change <leader> to ,
        nnoremap <leader>l :call ToggleNumber()<CR>
        nnoremap <leader>sv :source $MYVIMRC<CR>
        nnoremap <leader>1 :set number!<CR>
        nnoremap <leader>e :Texplore<CR>
        nnoremap <leader>/ :nohlsearch<CR>
        nnoremap <leader>2 $
        nnoremap <leader>@ ^
        let g:minimap_show='<leader>mm'
    " }}}
" }}}
" AUTO GROUPS {{{
    augroup configgroup
        autocmd!
        " Change Commentary in c++ from /* */ to //
        autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
        " disable auto comment continues on new line
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    augroup END
" }}}
" BACKUPS {{{
    " Disable backups file
    set nobackup

    " Disable vim common sequense for saving.
    " By default vim writes buffer to a new file, then deletes the original.
    " Then renames the new file.
    set nowritebackup

    " Disable swp files
    set noswapfile

" }}}
" CUSTOM FUNCTIONS {{{
    function! ToggleNumber()
        if(&relativenumber == 1)
            set norelativenumber
            set number
        else
            set relativenumber
        endif
    endfunc
" }}}
"

" vim:foldmethod=marker:foldlevel=0
