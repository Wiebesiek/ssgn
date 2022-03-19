# ssgn
==========

Super Simple Git Notes for Vim.

Why another notes plugin?
------------
I was unable to find a basic notes plugin to fit my workflow. This simple plugin creates a .txt file for each git repo. The file is stored in a location seperate from your git repo. SSGN looks to see if your current file is a part of a git repo, if so, it will open or create a new .txt file for taking notes about the repo.

Aside from git repos, there is also a 'main' note that you can access at anytime via :SSGNEditMainNote.

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
 
* Set a custom location for the notes directory

       let g:SSGNNoteDirectory = "~/Notes/" 


