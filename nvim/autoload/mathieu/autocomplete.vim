" Generic mechanism for scheduling a unit of deferable work.
"let s:expansion_active = 0

"function! mathieu#autocomplete#setup_mappings() abort
"  " Overwrite the mappings that UltiSnips sets up during expansion.
"  execute 'inoremap <buffer> <silent> ' . g:UltiSnipsJumpForwardTrigger .
"        \ ' <C-R>=mathieu#autocomplete#expand_or_jump("N")<CR>'
"  execute 'snoremap <buffer> <silent> ' . g:UltiSnipsJumpForwardTrigger .
"        \ ' <Esc>:call mathieu#autocomplete#expand_or_jump("N")<CR>'
"  execute 'inoremap <buffer> <silent> ' . g:UltiSnipsJumpBackwardTrigger .
"        \ ' <C-R>=mathieu#autocomplete#expand_or_jump("P")<CR>'
"  execute 'snoremap <buffer> <silent> ' . g:UltiSnipsJumpBackwardTrigger .
"        \ ' <Esc>:call mathieu#autocomplete#expand_or_jump("P")<CR>'

"  " One additional mapping of our own: accept completion with <CR>.
"  imap <expr> <buffer> <silent> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"  smap <expr> <buffer> <silent> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

"  let s:expansion_active = 1
"endfunction

"function! mathieu#autocomplete#teardown_mappings() abort
"  silent! iunmap <expr> <buffer> <CR>
"  silent! sunmap <expr> <buffer> <CR>

"  let s:expansion_active = 0
"endfunction

"" Note that we also set up a "Smart Backspace", to complement the "Smart
"" Tab" that mathieu#autocomplete#expand_or_jump() ends up using.
"inoremap <expr> <BS> mathieu#autocomplete#smart_bs()

"let g:ulti_jump_backwards_res = 0
"let g:ulti_jump_forwards_res = 0
"let g:ulti_expand_res = 0

"function! mathieu#autocomplete#expand_or_jump(direction) abort
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res == 0
"    " No expansion occurred.
"    if pumvisible()
"      " Pop-up is visible, let's select the next (or previous) completion.
"      if a:direction ==# 'N'
"        return "\<C-N>"
"      else
"        return "\<C-P>"
"      endif
"    else
"      if s:expansion_active
"        if a:direction ==# 'N'
"          call UltiSnips#JumpForwards()
"          if g:ulti_jump_forwards_res == 0
"            " We did not jump forwards.
"            return "\<Tab>"
"          endif
"        else
"          call UltiSnips#JumpBackwards()
"        endif
"      else
"        if a:direction ==# 'N'
"          return mathieu#autocomplete#smart_tab()
"        endif
"      endif
"    endif
"  endif

"  " No popup is visible, a snippet was expanded, or we jumped, or we failed to
"  " jump backwards, so nothing to do.
"  return ''
"endfunction

"if exists('*shiftwidth')
"  function! s:ShiftWidth()
"    if &softtabstop <= 0
"      return shiftwidth()
"    else
"      return &softtabstop
"    endif
"  endfunction
"else
"  function! s:ShiftWidth()
"    if &softtabstop <= 0
"      if &shiftwidth == 0
"        return &tabstop
"      else
"        return &shiftwidth
"      endif
"    else
"      return &softtabstop
"    endif
"  endfunction
"endif

"" Use <Tab> for leading indent (when 'noexpandtab'), spaces for everything else
"" (even when 'noexpandtab').
"function! mathieu#autocomplete#smart_tab() abort
"  if &l:expandtab
"    return "\<Tab>"
"  else
"    let l:prefix=strpart(getline('.'), 0, col('.') -1)
"    if l:prefix =~# '^\s*$'
"      return "\<Tab>"
"    else
"      " virtcol() returns last column occupied, so if cursor is on a tab it will
"      " report `actual column + tabstop` instead of `actual column`. So, get
"      " last column of previous character instead, and add 1 to it.
"      let l:sw=s:ShiftWidth()
"      let l:previous_char=matchstr(l:prefix, '.$')
"      let l:previous_column=strlen(l:prefix) - strlen(l:previous_char) + 1
"      let l:current_column=virtcol([line('.'), l:previous_column]) + 1
"      let l:remainder=(l:current_column - 1) % l:sw
"      let l:move=(l:remainder == 0 ? l:sw : l:sw - l:remainder)
"      return repeat(' ', l:move)
"    endif
"  endif
"endfunction

"" Mirror of mathieu#autocomplete#smart_tab().
"function! mathieu#autocomplete#smart_bs() abort
"  if &l:expandtab
"    return "\<BS>"
"  else
"    let l:col=col('.')
"    let l:prefix=strpart(getline('.'), 0, l:col - 1)
"    if l:prefix =~# '^\s*$'
"      return "\<BS>"
"    endif
"    let l:previous_char=matchstr(l:prefix, '.$')
"    if l:previous_char !=# ' '
"      return "\<BS>"
"    else
"      " Delete enough spaces to take us back to the previous tabstop.
"      "
"      " Originally I was calculating the number of <BS> to send, but Vim
"      " has some special casing that causes one <BS> to delete multiple
"      " characters even when 'expandtab' is off (eg. if you hit <BS> after
"      " pressing <CR> on a line with trailing whitespace and Vim inserts
"      " whitespace to match.
"      "
"      " So, turn 'expandtab' on temporarily and let Vim figure out what
"      " a single <BS> should do.
"      return "\<C-\>\<C-o>:set expandtab\<CR>" .
"            \ "\<C-\>\<C-o>:set noexpandtab\<CR>\<BS>"
"  endif
"endfunction

"let s:deoplete_init_done=0
"function! mathieu#autocomplete#deoplete_init() abort
"  if s:deoplete_init_done || !has('nvim')
"    return
"  endif
"  let s:deoplete_init_done=1
"  call deoplete#enable()
"  call deoplete#custom#source(
"        \   'masochist',
"        \   'content',
"        \   expand('~/code/masochist-pages')
"        \ )
"  call deoplete#custom#source(
"        \   'masochist',
"        \   'config',
"        \   expand('~/code/masochist/src/server/constants.js')
"        \ )
"  call deoplete#custom#source('file', 'rank', 2000)
"  call deoplete#custom#source('ultisnips', 'rank', 1000)
"  call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
"endfunction

