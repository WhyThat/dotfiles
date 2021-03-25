" Find files
" Fzf: {{{

" let $BAT_THEME='GitHub'
let $FZF_DEFAULT_COMMAND='rg --no-ignore-vcs --glob "!.git/*" --glob "!node_modules/*" --files --hidden '
let g:fzf_command_prefix = 'Fzf'
" nnoremap <Leader>fb  :FzfBuffers<CR>
" nnoremap <Leader>fh  :FzfHistory<CR>
" nnoremap <Leader>ft  :FzfBTags<CR>
" nnoremap <Leader>fT  :FzfTags<CR>
nnoremap <Leader>fS  :FzfSnippets<CR>
" nnoremap <Leader>fF  :FzfFiles<CR>
" nnoremap <Leader>fB  :FzfCommits<CR>
nnoremap <Leader>gcc  :FzfCommits<CR>
nnoremap <Leader>gcb  :FzfBCommits<CR>
nnoremap <Leader>gb  :FzfGBranches<CR>
" nnoremap <Leader>ff  :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>fN  :FzfFiles node_modules/<CR>
" nmap // :FzfBLines<CR>
nmap ?? :FzfRg!<space>
autocmd FileType fzf tnoremap <nowait><buffer> <esc> <c-g>

" }}}

