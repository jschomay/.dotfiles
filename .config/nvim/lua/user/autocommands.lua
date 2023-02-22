vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  " Autoformat
  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup end

  " Set to auto read when a file is changed from the outside
  set autoread
  au FocusGained * checktime

  " Save on focus lost
  au FocusLost * silent! :wa
  " Write all buffers before navigating from Vim to tmux pane (using vim-tmux-navigator)
  let g:tmux_navigator_save_on_switch = 2

  " % matchwords for Elixir
  autocmd FileType elixir let b:match_words = '\<\%(case\|cond\|if\|unless\|try\|loop\|receive\|fn\|with\|' .
      \ 'defmodule\|defimpl\|defmacro\|defdelegate\|defexception\|defcallback\|defoverridable\|defp\|def\|describe\|setup\|test\)\>=\@!:' .
      \ '\<\%(else\|elsif\|catch\|after\|rescue\|\-\)\>:' .
      \ '\<end\>,{:},\[:\],(:)'
]]
