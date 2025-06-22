# Configuration vimwiki `./USERNAME`
```nano
call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'

call plug#end()

let g:vimwiki_list = [{
      \ 'path': '~/Documents/B/BB/',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'index': 'console',
      \ 'diary_rel_path': 'journal/',
      \ 'diary_index' : 'console'
      \ }]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
```

