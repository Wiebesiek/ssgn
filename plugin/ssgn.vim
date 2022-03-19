if !exists('g:SSGNMainNoteLocation')
    let g:SSGNMainNoteLocation = '~/TODO.txt'
end

if !exists('g:SSGNNoteDirectory')
    let g:SSGNNoteDirectory = stdpath('data') . "/plugged/SSGN/data/"
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
