
" EasyMotion
" {{{

nmap <Leader><Leader>W <Plug>(easymotion-bd-w)

" }}}

" Supertab
" {{{

let g:SuperTabDefaultCompletionType    = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x><C-o>"

" }}}

" Emmet
" {{{
let g:user_emmet_expandabbr_key='<C-@>'
imap <expr> <C-Space> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}
"}}}

" Intellisense
" Coc: {{{
  " Don't give |ins-completion-menu| messages.
  set shortmess+=c

  " Always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
  inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " Used in the tab autocompletion for coc
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


  " Used to expand decorations in worksheets
  nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType scala setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format          :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold            :call CocAction('fold', <f-args>)

  " Show all diagnostics
  nnoremap <silent> <space>a        :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e        :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c        :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o        :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s        :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j        :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k        :<C-u>CocPrev<CR>
  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> <space>h            <Plug>(coc-diagnostic-prev)
  nmap <silent> <space>l            <Plug>(coc-diagnostic-next)
  nmap <silent> [c                  <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c                  <Plug>(coc-diagnostic-next)
  " Resume latest coc list
  nnoremap <silent> <space>p        :<C-u>CocListResume<CR>
  inoremap <expr> <cr>              pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  autocmd! CompleteDone *           if pumvisible() == 0 | pclose | endif

  nmap <silent> gd                  <Plug>(coc-definition)
  nmap <silent> gy                  <Plug>(coc-type-definition)
  nmap <silent> gi                  <Plug>(coc-implementation)
  nmap <silent> gr                  <Plug>(coc-references)
  let g:echodoc#enable_at_startup = 1

  " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  " }}}
" Ale: {{{

let g:ale_reason_ls_executable          = "/usr/local/bin/reason-language-server"
let g:ale_reasonml_refmt_executable     = "bsrefmt"
let g:ale_fixers                        = {}
let g:ale_fixers['javascript']          = ['eslint', 'prettier']
let g:ale_fixers['json']                = ['prettier']
let g:ale_fixers['reason']              = ['refmt']
let g:ale_fix_on_save                   = 1
" Fix files automatically on save
let g:ale_pattern_options               = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}

let g:reasonml_project_airline          = 1
let g:reasonml_syntastic_airline        = 1
let g:reasonml_clean_project_airline    = 1
let g:airline#extensions#reason#enabled = 1
let g:ale_sign_error                    = '❌'
let g:ale_sign_warning                  = '⚠️'

" }}}

" Markdown
" {{{

  let g:pencil#textwidth = 80
  let g:vim_markdown_folding_disabled = 1
  au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
  let g:markdown_fenced_languages = ['rust', 'css', 'yaml', 'javascript', 'html', 'vim','json']
  augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'soft'})
  augroup END

" }}}

" Snippets
" {{{

  let g:UltiSnipsExpandTrigger            = "<c-s>"
  let g:UltiSnipsJumpForwardTrigger       = "<c-b>"
  let g:UltiSnipsJumpBackwardTrigger      = "<c-z>"
  let g:UltiSnipsSnippetsDir              = "~/.config/nvim/snips"
  let g:UltiSnipsSnippetDirectories       = ["UtilSnips", "snips"]

  "}}}

" Netrew
" {{{

" Set preferred view
  let g:netrw_liststyle = 3
  " Remove banner
  let g:netrw_banner = 0

" }}}

" Find files
" Fzf: {{{

let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b  :FzfBuffers<CR>
nnoremap <Leader>h  :FzfHistory<CR>
nnoremap <Leader>t  :FzfBTags<CR>
nnoremap <Leader>T  :FzfTags<CR>
nnoremap <C-p>      :FzfFiles<CR>
nnoremap <Leader>p  :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>gt :FzfAg<CR>

" }}}
" Ripgrep: {{{
  if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
  endif
" }}}

" Conoline
"  {{{

  " Highlight the line of the cursor
  let g:conoline_auto_enable                    = 1
  let g:conoline_use_colorscheme_default_insert = 1

" }}}

" Git
" Gutentags: {{{

  let g:gutentags_file_list_command = "rg --files --follow --ignore-file '/home/mathieu/.vimignore'"

" }}}
" Signify: {{{

" Check for only Git
let g:signify_vcs_list = [ 'git' ]

" Jump to next and previous hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" Hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
" }}}
" Fugitive: {{{

  nmap <leader>gw :Gwrite<CR>
  nmap <leader>gc :Gcommit<CR>
  nmap <leader>gs :Gstatus<CR>

" }}}

" Test
" {{{

  let test#neovim#term_position = "vert"
  let test#strategy             = "neovim"
  nmap <silent> t<C-n> :TestNearest<CR>
  nmap <silent> t<C-f> :TestFile<CR>
  nmap <silent> t<C-s> :TestSuite<CR>
  nmap <silent> t<C-l> :TestLast<CR>
  nmap <silent> t<C-g> :TestVisit<CR>

  " }}}

" projectionist
" {{{

nmap <leader><leader>a  :A<CR>
nmap <leader><leader>av :AV<CR>
nmap <leader><leader>ax :AS<CR>
nmap <leader><leader>at :AT<CR>

" }}}

" easy-align
" {{{

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" }}}

" local-vim
" {{{

  let g:localvimrc_sandbox = 0

" }}}

"Airline
" {{{

  let g:airline_highlighting_cache                = 1
  let g:airline#extensions#tabline#enabled        = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#coc#enabled = 1
  " Airline already shows the current mode
  set noshowmode

" }}}

