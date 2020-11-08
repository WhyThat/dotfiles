autocmd FileType * call s:Test()

function! s:ScanFile()
  let n = 1
  let nmax = line('$')
  if line('$') > 500
    let nmax = 500
  endif
  while n < nmax
    if getline(n) =~# "\\v<React>"
      return 1
      break
    endif
    let n = n + 1
  endwhile
  return 0
endfunction

function! s:Test()
  if match(&filetype, '\v<javascript|typescript|reason>') == -1
    return
  endif

  if match(&filetype, 'react') != -1
    return
  endif

  let l:file=expand('<afile>')
  if s:ScanFile()
    noautocmd set filetype+=react
  endif

endfunction

