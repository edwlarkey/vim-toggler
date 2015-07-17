" plugin/toggler.vim
" Author: Edward Larkey


function! s:searchLine(query)
  return match(getline('.'), '\s*'.a:query)
endfunction

function! s:searchLists(list)
  for l:group in a:list
    for l:item in l:group
      let l:item_match = s:searchLine(l:item)
      if l:item_match >= 0
        " return index(l:group, l:item)
        return [index(a:list, l:group), index(l:group, l:item)]
      endif
    endfor
  endfor
  return 0
endfunction

function! toggler#Toggle()
  let l:line = getline('.')

  let l:matches = s:searchLists(g:toggler_keywords)

  if type(l:matches) == type([])
    let [l:index, l:index_item] = l:matches

    let l:max_index = (len(g:toggler_keywords[l:index]) - 1)

    let l:find = get(g:toggler_keywords[l:index], l:index_item)

    let l:index_item = l:index_item + 1

    if l:index_item > l:max_index
      let l:index_item = 0
    endif

    let l:replace = get(g:toggler_keywords[l:index], l:index_item)

    let l:line = substitute(l:line, l:find, l:replace, "")
    call setline('.', line)
  endif
endfunction
