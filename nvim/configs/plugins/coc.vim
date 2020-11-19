" " Don't give |ins-completion-menu| messages.
" set shortmess+=c

" " Always show signcolumns
" set signcolumn=yes

" " Used in the tab autocompletion for coc
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Used to expand decorations in worksheets
" nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType scala setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format          :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold            :call CocAction('fold', <f-args>)
" " Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" " Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" " Use <leader>x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)
" " Show all diagnostics
" " nnoremap <silent> <space>a        :<C-u>CocList diagnostics<cr>
" " " Manage extensions
" " nnoremap <silent> <space>e        :<C-u>CocList extensions<cr>
" " " Show commands
" " nnoremap <silent> <space>c        :<C-u>CocList commands<cr>
" " " Find symbol of current document
" " nnoremap <silent> <space>o        :<C-u>CocList outline<cr>
" " " Search workspace symbols
" " nnoremap <silent> <space>s        :<C-u>CocList -I symbols<cr>
" " " Do default action for next item.
" " nnoremap <silent> <space>j        :<C-u>CocNext<CR>
" " " Do default action for previous item.
" " nnoremap <silent> <space>k        :<C-u>CocPrev<CR>
" " " Use `[c` and `]c` to navigate diagnostics
" " nmap <silent> <space>h            <Plug>(coc-diagnostic-prev)
" " nmap <silent> <space>l            <Plug>(coc-diagnostic-next)
" " wrap :cnext/:cprevious and :lnext/:lprevious
" function! WrapCommand(direction, prefix)
"   if a:direction == "up"
"     try
"       execute a:prefix . "previous"
"     catch /^Vim\%((\a\+)\)\=:E553/
"       execute a:prefix . "last"
"     catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
"     endtry
"   elseif a:direction == "down"
"     try
"       execute a:prefix . "next"
"     catch /^Vim\%((\a\+)\)\=:E553/
"       execute a:prefix . "first"
"     catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
"     endtry
"   endif
" endfunction
" " [c ]c go up and down the location list and wrap around
" nnoremap <silent> [c :call WrapCommand('up', 'l')<CR>
" nnoremap <silent> ]c  :call WrapCommand('down', 'l')<CR>
" " Resume latest coc list
" " nnoremap <silent> <space>p        :<C-u>CocListResume<CR>
" inoremap <expr> <cr>              pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" autocmd! CompleteDone *           if pumvisible() == 0 | pclose | endif

" nmap <silent> gd                  <Plug>(coc-definition)
" nmap <silent> gy                  <Plug>(coc-type-definition)
" nmap <silent> gi                  <Plug>(coc-implementation)
" nmap <silent> gr                  <Plug>(coc-references)
" let g:echodoc#enable_at_startup = 1
