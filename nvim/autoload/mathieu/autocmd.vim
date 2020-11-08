function! mathieu#autocmds#idleboot() abort
  " Make sure we automatically call wincent#autocmds#idleboot() only once.
  augroup MathieuIdleboot
    autocmd!
  augroup END

  " Make sure we run deferred tasks exactly once.
  doautocmd User WincentDefer
  autocmd! User WincentDefer
endfunction


" Wait until idle to run additional "boot" commands.
augroup MathieuIdleboot
  autocmd!
  if has('vim_starting')
    " autocmd CursorHold,CursorHoldI * call wincent#autocmds#idleboot()
  endif
augroup END

