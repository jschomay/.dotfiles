" Modified from http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use terminal colors (needs to run before anythign else)
set termguicolors

set nocompatible              " be iMproved, required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug package manager

" auto install
if has('nvim') && empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
   silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !has('nvim') && empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-plug' " registers plugin for help text, not needed for install
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/SearchComplete'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'gcmt/wildfire.vim'
Plug 'antew/vim-elm-language-server'
Plug 'craigemery/vim-autotag'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace'
Plug 'chriskempson/base16-vim'
Plug 'sjl/vitality.vim'
Plug 'bhurlow/vim-parinfer'
" Plug 'venantius/vim-cljfmt'
" Plug 'fbeline/kibit-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'mbbill/undotree'
Plug 'tpope/vim-obsession'
Plug 'jceb/vim-orgmode'
Plug 'junegunn/goyo.vim'
Plug 'romainl/vim-devdocs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'janko/vim-test'
Plug 'Shougo/echodoc.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
" coc extentions
Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-marketplace', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

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
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>

set tags=tags,.tags,client/.tags

nmap <leader>v :vsplit <cr>
nmap <leader>s :split <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" set cursorcolumn

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

set signcolumn=yes

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

colorscheme base16-gruvbox-dark-medium


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

au FileType javascript setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType elixir setl sw=2 sts=2 et

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <C-p> :GFiles<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

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
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map 0 ^


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => grep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gr :Ggrep <cword><CR>

" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set runtimepath^=~/.vim/bundle/ctrlp.vim

vnoremap * y/<C-R>"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" show yank list (via Coc) with leader-p, or on `"` in insert
map <leader>p :<C-u>CocList -A --normal yank<cr>
inoremap <silent> <C-r>  <Esc>:<C-u>CocList -A --normal yank<cr>

autocmd BufReadPost fugitive://* set bufhidden=delete

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" formatting - text width 85, auto formatting, but only in comments
set tw=85
autocmd BufNewFile,BufRead * setlocal fo+=w fo+=r fo-=t fo-=o fo-=l

set cursorcolumn

" change cursor on insert mode (works in OSX iTerm)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" copying to the system clipboard (needs vim 7.4+)
" set unamed to copy stright into the system register
" leave empty to require "* to go into system register
set clipboard=


set mouse=a


" vimux 'slime'
function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

 " If text is selected, save it in the v buffer and send that buffer it to tmux
 vmap <C-c><C-c> "vy :call VimuxSlime()<CR>
 " Select current paragraph and send it to tmux
 nmap <C-c><C-c> vip<C-c><C-c>

autocmd BufReadPost *.org setlocal textwidth=500

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let test#strategy = 'vimux'

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> <C-t><C-n> :TestNearest<CR>
nmap <silent> <C-t><C-f> :TestFile<CR>
nmap <silent> <C-t><C-s> :TestSuite<CR>
nmap <silent> <C-t><C-l> :TestLast<CR>
nmap <silent> <C-t><C-g> :TestVisit<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" navigate chunks of current buffer
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" git status with fzf
nnoremap <silent> gst :GFiles?<CR>
nnoremap <silent> <leader>gi :CocCommand git.chunkInfo<CR>
nnoremap <silent> <leader>gu :CocCommand git.chunkUndo<CR>
nnoremap <silent> <leader>ga :CocCommand git.chunkStage<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linting / Completion / Snippets / LSP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" close preview window
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use `[d` and `]d` to navigate diagnostics (`e` jumps directly to errors)
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> <leader>e <Plug>(coc-diagnostic-info)
nnoremap <silent> <leader>d  :<C-u>CocList -A --normal diagnostics<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


function! RandomColorScheme()
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")

  let components = split(reltimestr(reltime()), '\.')
  let microseconds = components[-1] + 0

  let mycol = mycolors[microseconds % len(mycolors)]
  let mycol = split(mycol, '/')[-1]
  let mycol = substitute(mycol, '\.vim', '', '')

  exec "colorscheme " . mycol
  " display it
  exec "colorscheme"

  unlet mycolors
  unlet mycol
endfunction

:command! NewColor call RandomColorScheme()
