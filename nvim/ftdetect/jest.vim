autocmd FileType * call s:Test()

function! s:Test()
  if match(&filetype, '\v<javascript|javascriptreact|typescript|typescriptreact|reason>') == -1
    return
  endif

  if match(&filetype, 'jest') != -1
    return
  endif

  let l:file=expand('<afile>')

  if match(l:file, '\v(Spec|Test|-spec|\.spec|_spec|-test|\.test|_test|_Test)\.(js|jsx|ts|tsx|re)$') != -1 ||
        \ match(l:file, '\v/__tests__|tests?/.+\.(js|jsx|ts|tsx)$') != -1
    noautocmd set filetype+=jest
  endif
endfunction
