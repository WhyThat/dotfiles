autocmd FileType * call s:Stories()

function! s:Stories()
  if match(&filetype, '\v<javascript|javascriptreact|typescript|typescriptreact|reason>') == -1
    return
  endif

  if match(&filetype, 'stories') != -1
    return
  endif

  let l:file=expand('<afile>')

  if match(l:file, '\v(Stories)\.(js|jsx|ts|tsx|re)$') != -1 ||
        \ match(l:file, '\v/__stories|tests?/.+\.(js|jsx|ts|tsx|re)$') != -1
    noautocmd set filetype+=.stories
  endif
endfunction

