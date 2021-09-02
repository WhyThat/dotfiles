let g:gutentags_file_list_command = "rg --files --follow --ignore-file '/home/mathieu/.vimignore'"
"
" Check for only Git
let g:signify_vcs_list = [ 'git' ]

" Jump to next and previous hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" Hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)

nmap <leader>gf :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Git<CR>


