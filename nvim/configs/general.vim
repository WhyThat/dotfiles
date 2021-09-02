set autoread
au BufWinEnter * checktime

" filetype plugin indent on    " required
" runtime macros/matchit.vim

syntax enable

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif


set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" Stop concealing quotes in JSON
let g:vim_json_syntax_conceal = 0

" Enable JSX syntax highlighting in .js files
let g:jsx_ext_required = 0



augroup numbertoggle
  let s:auto_rel = 1
  function! ToggleNumber()
    if (s:auto_rel == 1)
      let s:auto_rel = 0
      set norelativenumber
    else
      let s:auto_rel = 1
      set relativenumber
    endif
  endfunction

  function! OnLeave()
    if (s:auto_rel == 1)
      set relativenumber
    endif
  endfunction

  function! OnEnter()
    if (s:auto_rel == 1)
      set norelativenumber
    endif
  endfunction

  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * call OnLeave()
  autocmd BufLeave,FocusLost,InsertEnter   * call OnEnter()
augroup END

" More natural split opening.
set splitbelow
set splitright

" Show leader key
set showcmd

" #TABS AND SPACES {{{
" Indentation
set autoindent
set smartindent
set smarttab
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
"}}}

set number " Show line numbers
set noswapfile " No swap file
set nobackup
set nowritebackup

set textwidth=80
set formatoptions+=t
set colorcolumn=+1
set showmatch
set lazyredraw

" Search all subfolders
set path+=**

" Display matching files on tab complete
set wildmenu

" Ignore node_modules and images from search results
set wildignore+=**/node_modules/**,**/dist/**,**_site/**,*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map

" Use the system register for all cut yank and paste operations
set clipboard=unnamedplus

" Show Invisibles
set list
set listchars=tab:→→,eol:¬

" Automatically hide buffer with unsaved changes without showing warning
set hidden

" Treat all numbers as decimal regardless of whether they are padded with zeros
set nrformats=

" Highlight matches when using :substitute
set nohlsearch

" Predicts case sensitivity intentions
set smartcase
set ignorecase

" Jump to match when searching
set incsearch
set inccommand=split

if has('mouse')
  set mouse=a
endif

hi NonText guifg=#4a4a59
hi SpecialKey guifg=white guibg=#cc0000

" Strip trailing whitespace from all files
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e

" Automatically remove the preview window after autocompletion
autocmd CompleteDone * pclose

au BufRead,BufNewFile,BufReadPost *.json set syntax=json

" Rainbow.vim
let g:rainbow_active = 1

let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_sort_options = 'i'
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <C-space> <Plug>(completion_trigger)
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_enable_snippet = 'vim-vsnip'
" Avoid showing message extra message when using completion
" set shortmess+=c
