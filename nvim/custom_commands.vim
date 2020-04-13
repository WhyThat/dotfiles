function! ChangeWorkspace(name)
  let executable = "yarn workspace " . a:name . " test"
  let g:test#javascript#jest#executable = executable
  echom "jest executable set to " executable
endfunction
