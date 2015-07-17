" plugin/toggler.vim
" Author: Edward Larkey

let s:options = {}

let s:options['toggleables'] = [
  \ ['Positive', 'Negative'],
  \ ['TODO', 'DOING', 'DONE'],
  \ ['TRUE', 'FALSE'],
  \ ['YES', 'NO'],
  \ ['[]', '[x]'],
  \]

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
endfunction

function! toggler#Toggle()
  let l:line = getline('.')

  let [l:index, l:index_item] = s:searchLists(s:options['toggleables'])

  let l:max_index = (len(s:options['toggleables'][l:index]) - 1)

  let l:find = get(s:options['toggleables'][l:index], l:index_item)

  let l:index_item = l:index_item + 1

  if l:index_item > l:max_index
    let l:index_item = 0
  endif

  let l:replace = get(s:options['toggleables'][l:index], l:index_item)

  let l:line = substitute(l:line, l:find, l:replace, "")
  call setline('.', line)
endfunction
