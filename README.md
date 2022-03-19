# ssgn
==========
Super Simple Git Notes for Vim.

Installation
------------
1. add ```Plug 'wcascades/ssgn'``` to you vimrc.
2. run ```:PlugInstall``` in ex mode.

Recommnded use
------------
add the following to your vimrc
```
map <leader>tn :SSGNEditGitNote <CR>
map <leader>tm :SSGNEditMainNote <CR>
```

Configuration
------------
* Set a custom location for the main note
let g:SSGNMainNoteLocation = "~/todo.txt" 

