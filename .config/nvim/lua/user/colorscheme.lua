vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry


function! RandomColorScheme()
  let mycolors = split(globpath(&rtp,"colors/*.vim"),"\n")

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
]]
