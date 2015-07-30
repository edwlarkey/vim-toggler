# Toggler

Easy toggling between sets of keywords

## Introduction

This plugin makes it easier to toggle between different sets of keywords. E.g.
[TODO, DOING, DONE], [YES, NO], [TRUE, FALSE], etc.

Inspiration came from Org Mode. I didn't really need all of the functionality
that it provided, but I did like how it could toggle between TODO and DONE for
tasks. About halfway through writting this plugin, I found
[vim-cycle](https://github.com/zef/vim-cycle) which did almost everything I
wanted.

## Commands

There are no default mappings. There is simply one command.

:Toggle           Toggles to next keyword found on the current line.

## Installation

Use whatever method you used to install your other plugins. I use
[vim-plug](https://github.com/junegunn/vim-plug).
[Vundle](https://github.com/VundleVim/Vundle.vim) and
[Pathogen](https://github.com/tpope/vim-pathogen) work great too.

## Config

Lists of keywords can be set in your vimrc.

The default set of keywords are:

```
let g:toggler_keywords = [
  \ ['TODO', 'DOING', 'DONE'],
  \ ['Positive', 'Negative'],
  \ ['True', 'False'],
  \ ['YES', 'NO'],
  \ ['\[ \]', '\[x\]'],
  \]
```


This is what I use in my vimrc. I have a modified set of keywords as well as
<leader>t mapped to :Toggle

```
:nnoremap <leader>t :Toggle<CR>

let g:toggler_keywords = [
  \ ['TODO', 'DOING', 'DONE'],
  \ ['YES', 'NO'],
  \ ['\[ \]', '\[x\]'],
  \]
```

## License

Distributed under the same terms as Vim. `:help license`
