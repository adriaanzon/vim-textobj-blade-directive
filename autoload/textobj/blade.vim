let s:start_pattern = '\v\@(section|if|unless|foreach|forelse|for|while|push' .
      \ '|can|cannot|hasSection|php|verbatim|component|slot)'
let s:end_pattern =  '\v\@(end\w+|stop|show|append|overwrite)'
let s:skip_pattern = 'synIDattr(synID(line("."), col("."), 0), "name") !=# "bladeKeyword"'

function! s:searchpair()
  let flags = 'W'

  if expand('<cword>') =~? '\v(end\w+|stop|show|append|overwrite)'
    let flags = 'bcW'
  endif

  return searchpair(s:start_pattern,'',s:end_pattern, flags, s:skip_pattern)
endfunction

function! textobj#blade#select_a()
  if s:searchpair()
    let end_pos = getpos('.')

    " Jump to match
    normal %
    let start_pos = getpos('.')

    return ['V', start_pos, end_pos]
  else
    return 0
  endif
endfunction

function! textobj#blade#select_i()
  if s:searchpair()
    " Move up one line, and save position
    normal k^
    let end_pos = getpos('.')

    " Move down again, jump to match, then down one line and save position
    normal j^%j
    let start_pos = getpos('.')

    return ['V', start_pos, end_pos]
  else
    return 0
  endif
endfunction
