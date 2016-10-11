let s:start_pattern = '\v\zs\@(section|if|unless|foreach|forelse|for|while|push|can|cannot|hasSection|php|verbatim)'
let s:end_pattern =  '\v\zs\@(end\w+|stop|show|append|overwrite)'
let s:skip_pattern = 'synIDattr(synID(line("."), col("."), 0), "name") !=# "bladeKeyword"'

function! textobj#blade#select_a()
  let s:flags = 'W'

  call searchpair(s:start_pattern,'',s:end_pattern, s:flags, s:skip_pattern)
  let end_pos = getpos('.')

  " Jump to match
  normal %
  let start_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction

function! textobj#blade#select_i()
  let s:flags = 'W'
  if expand('<cword>') =~? '\v(end\w+|stop|show|append|overwrite)'
    let s:flags = 'cW'
  endif

  call searchpair(s:start_pattern,'',s:end_pattern, s:flags, s:skip_pattern)

  " Move up one line, and save position
  normal k^
  let end_pos = getpos('.')

  " Move down again, jump to match, then down one line and save position
  normal j^%j
  let start_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction
