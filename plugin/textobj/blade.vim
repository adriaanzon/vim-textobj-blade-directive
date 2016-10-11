if exists('g:loaded_textobj_blade_directive')
  finish
endif

call textobj#user#plugin('blade', {
      \   '-': {
      \     'select-a': 'ad', '*select-a-function*': 'textobj#blade#select_a',
      \     'select-i': 'id', '*select-i-function*': 'textobj#blade#select_i',
      \   }
      \ })

let g:loaded_textobj_blade_directive = 1
