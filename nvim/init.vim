" Each section of my config has been separated out into subsections in ./configs/
filetype off " required  Prevents potential side-effects from system ftdetects scripts

augroup vimrc "Ensure all autocommands are cleared
  autocmd!
augroup END

"-----------------------------------------------------------------------
"Leader bindings
"-----------------------------------------------------------------------
nnoremap <Space> <Nop>
let g:mapleader = " "

" WARNING: Hard coding the location of my dotfiles is brittle
let g:dotfiles = strlen($DOTFILES) ? $DOTFILES : '~/dotfiles'
let g:vim_dir = g:dotfiles . '/nvim'
"-----------------------------------------------------------------------
" Essential Settings - Taken care of by Vim Plug
"-----------------------------------------------------------------------
filetype plugin indent on
syntax enable
set termguicolors     " enable true colors support
" ----------------------------------------------------------------------
" Plugin Configurations
" ----------------------------------------------------------------------
" Order matters here as the plugins should be loaded before the other setup
" :h runtime - this fuzzy maches files within vim's runtime path
runtime configs/plugins.vim
runtime configs/general.vim
" runtime configs/highlight.vim
runtime configs/mapping.vim
runtime configs/statusline.vim
runtime templates/template.vim

runtime! configs/plugins/*.vim
lua require("global")
lua require("lsp_config")
lua require("galaxy")
lua require("m-barbar")
lua require("m-specs")
lua require("ts-autotag")
lua require("treesitter")
lua require("refactoring2")

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

colorscheme doom-one
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
let g:tagalong_additional_filetypes = ['rescript']
