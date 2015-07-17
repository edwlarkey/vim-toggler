" plugin/toggler.vim
" Author: Edward Larkey

if exists("g:loaded_toggler") || &cp
  finish
endif
let g:loaded_toggler = 1

nnoremap <silent> <Plug>Toggle     :<C-U>call <SID>toggler#Toggle()<CR>

:command Toggle :call toggler#Toggle()
