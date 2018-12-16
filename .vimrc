" Modified from http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use terminal colors (needs to run before anythign else)
set termguicolors


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle package manager

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" My plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'SearchComplete'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'gcmt/wildfire.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'ElmCast/elm-vim'
Plugin 'w0rp/ale'
Plugin 'ajh17/VimCompletesMe'
Plugin 'craigemery/vim-autotag'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fireplace'
Plugin 'chriskempson/base16-vim'
Plugin 'sjl/vitality.vim'
Plugin 'bhurlow/vim-parinfer'
Plugin 'venantius/vim-cljfmt'
Plugin 'fbeline/kibit-vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-obsession'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'jgdavey/tslime.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'romainl/vim-devdocs'
Plugin 'christoomey/vim-tmux-navigator'
"""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show line numbers
set number
set nornu

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained * checktime

" Save on focus lost
au FocusLost * silent! :wa
" Write all buffers before navigating from Vim to tmux pane (using vim-tmux-navigator)
let g:tmux_navigator_save_on_switch = 2

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :wa<cr>

" quick-edit vimrc (http://learnvimscriptthehardway.stevelosh.com/chapters/07.html)
nmap <leader>ev :vsplit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>

set tags=tags,.tags,client/.tags

nmap <leader>v :vsplit <cr>
nmap <leader>s :split <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" window split defaults
set splitbelow
set splitright

set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" colorscheme gruvbox
colorscheme base16-tomorrow-night


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guifont=Monaco\ 9.5
    colorscheme base16-eighties
endif


hi clear SpellBad
hi SpellBad cterm=underline gui=underline

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

au FileType css setl sw=2 sts=2 et

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => grep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open grep and put the cursor in the right position
map <leader>gr :grep! -R  .<left><left>

" Grep as a proper vim command
:nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

nnoremap <silent> gr :Ggrep <cword><CR>

" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set runtimepath^=~/.vim/bundle/ctrlp.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" quick paste last yank
map <leader>p "0p
map <leader>P "0P

" Fullscreen
map <silent> <F11> :exe "!wmctrl -r ".v:servername." -b toggle,fullscreen"<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set formatoptions-=c formatoptions-=r formatoptions-=o

set cursorcolumn

" change cursor on insert mode (works in OSX iTerm)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" copying to the system clipboard (needs vim 7.4+)
" set unamed to copy stright into the system register
" leave empty to require "* to go into system register
set clipboard=


set mouse=a

vmap <C-c><C-c> <Plug>SendSelectionToTmux
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
nmap <C-c>r <Plug>SetTmuxVars


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


nmap <leader>a :ALENextWrap <cr>
nmap <leader>e :ALEDetail <cr>

let g:ale_elixir_elixir_ls_release = '/Users/schomay/elixir-ls/rel'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'elixir': ['mix_format'],
\   'elm': ['elm-format'],
\}
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'elixir': ['credo', 'elixir-ls'],
\   'elm': ['make'],
\}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Elm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 0
let g:elm_jump_to_error = 0
let g:elm_detailed_complete = 1
let g:elm_make_show_warnings = 1

au FileType elm nmap K <Plug>(elm-show-docs)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rbpt_colorpairs = [
    \ ['brown',       'Gray93'],
    \ ['brown',       'Gray60'],
    \ ['brown',       'LightPink3'],
    \ ['gray',        'DarkSeaGreen3'],
    \ ['darkblue',    'Tan'],
    \ ['darkgreen',   'LightSkyBlue3'],
    \ ['darkmagenta', 'Thistle3'],
    \ ['darkcyan',    'LightCyan3'],
    \ ]

" originals:
    " \ ['red',         'RoyalBlue3'],
    " \ ['brown',       'SeaGreen3'],
    " \ ['blue',        'DarkOrchid3'],
    " \ ['gray',        'firebrick3'],
    " \ ['green',       'RoyalBlue3'],
    " \ ['magenta',     'SeaGreen3'],
    " \ ['cyan',        'DarkOrchid3'],
    " \ ['darkred',     'firebrick3'],
    " \ ['brown',       'RoyalBlue3'],
    " \ ['darkblue',    'DarkOrchid3'],
    " \ ['gray',        'firebrick3'],
    " \ ['darkgreen',   'RoyalBlue3'],
    " \ ['darkmagenta', 'SeaGreen3'],
    " \ ['darkcyan',    'DarkOrchid3'],
    " \ ['red',         'firebrick3'],
    " \ ]

au FileType clojure RainbowParenthesesActivate
au FileType clojure RainbowParenthesesLoadRound
au FileType clojure RainbowParenthesesLoadSquare
au FileType clojure RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


function! QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
