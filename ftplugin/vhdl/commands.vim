noremap <leader>c :call <SID>ToggleComment(getcurpos()[1], getcurpos()[2])<cr>

function! s:CheckComment(line)
    let context = getline(a:line)
    return context[0:1] ==# "--"
endfunction

function! s:CommentLine(line)
    execute "normal! :" . a:line . "\<cr>0i--\<esc>"
endfunction

function! s:UncommentLine(line)
    execute "normal! :" . a:line . "\<cr>02dl\<esc>"
endfunction

function! s:ToggleComment(line, colomn)
    if s:CheckComment(a:line)
        call s:UncommentLine(a:line)
        call setpos(".", [0, a:line, a:colomn - 2, 0])
    else
        call s:CommentLine(a:line)
        call setpos(".", [0, a:line, a:colomn + 2, 0])
    endif
endfunction

