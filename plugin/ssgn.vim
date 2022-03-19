if !exists('g:SSGNNoteDirectory')
    let g:SSGNNoteDirectory = stdpath('data') . "/plugged/ssgn/data/"
    if !isdirectory(g:SSGNNoteDirectory)
        call mkdir(g:SSGNNoteDirectory, "p")
    endif
end

if !exists('g:SSGNMainNoteLocation')
    let g:SSGNMainNoteLocation = g:SSGNNoteDirectory . "MainNote.txt"
end

func! g:SSGNEditMainNote()
    execute "e " . fnameescape(g:SSGNMainNoteLocation)
endf

func! g:SSGNEditGitNote()
    if s:InGitRepo()
        let gitNoteFileName = substitute(GetGitRemoteOrigin(),'\(/\|@\|:\)','_', 'g')
        execute "e " . fnameescape(g:SSGNNoteDirectory) . gitNoteFileName . ".txt"
    end
endf

func! s:InGitRepo()
    let isRepo = substitute(system("! git rev-parse --is-inside-work-tree"), '\n\+$', '', '')
    if isRepo == 'true'
        return 1
    else
        return 0
    endif
endf

func! GetGitRemoteOrigin()
    return substitute(system("git remote get-url origin"), '\n\+$', '', '')
endf

command! SSGNEditMainNote :call SSGNEditMainNote()
command! SSGNEditGitNote :call SSGNEditGitNote()
