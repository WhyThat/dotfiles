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

nnoremap <leader>i iHello World<esc>

" WARNING: Hard coding the location of my dotfiles is brittle
let g:dotfiles = strlen($DOTFILES) ? $DOTFILES : '~/dotfiles'
let g:vim_dir = g:dotfiles . '/nvim'
"-----------------------------------------------------------------------
" Essential Settings - Taken care of by Vim Plug
"-----------------------------------------------------------------------
filetype plugin indent on
syntax enable
set termguicolors     " enable true colors support
set background=light
" ----------------------------------------------------------------------
" Plugin Configurations
" ----------------------------------------------------------------------
" Order matters here as the plugins should be loaded before the other setup
" :h runtime - this fuzzy maches files within vim's runtime path
runtime configs/plugins.vim
runtime configs/general.vim
runtime configs/highlight.vim
runtime configs/mapping.vim
runtime configs/statusline.vim
runtime templates/template.vim
runtime keys.vim

runtime! configs/plugins/*.vim
